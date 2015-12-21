CommentType = GraphQL::ObjectType.define do
  name "Comment"
  interfaces [NodeIdentification.interface]
  description "A Comment"
  global_id_field :id

  field :content, types.String
  field :created_at, types.String
  field :user, UserType
end
