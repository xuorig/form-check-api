MutationRoot = GraphQL::ObjectType.define do
  name "Mutation"
  description "The root for mutations in this schema"
  field :signup, field: SignUpMutation.field
  field :signin, field: SignInMutation.field
  field :facebookLogin, field: FacebookLoginMutation.field
  field :addFormCheck, field: AddFormCheckMutation.field
  field :addComment, field: AddCommentMutation.field
end
