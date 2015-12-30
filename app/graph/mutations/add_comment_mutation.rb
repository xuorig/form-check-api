AddCommentMutation = GraphQL::Relay::Mutation.define do
  name "AddComment"
  input_field :content, !types.String
  input_field :formCheckId, !types.String

  return_field :formcheck, FormCheckType
  return_field :newCommentEdge, CommentType.edge_type

  resolve -> (args, ctx) {
    form_check = FormCheck.find(args[:formCheckId])
    comment = Comment.new(
      user_id: ctx[:current_user].id,
      content: args[:content]
    )
    form_check.comments << comment

    # Kinda hacky see https://github.com/rmosolgo/graphql-relay-ruby/pull/6
    connection = GraphQL::Relay::RelationConnection.new(form_check, {})
    newCommentEdge = GraphQL::Relay::Edge.new(comment, connection)

    {formcheck: form_check, newCommentEdge: newCommentEdge}
  }
end
