UserType = GraphQL::ObjectType.define do
  name "User"
  interfaces [NodeIdentification.interface]
  description "A User"
  global_id_field :id

  field :email, types.String
end
