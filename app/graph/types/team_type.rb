TeamType = GraphQL::ObjectType.define do
  name "Team"
  interfaces [NodeIdentification.interface]
  global_id_field :id
  description "A Team"

  field :rails_id do
    type !types.Int
    resolve -> (obj, args, ctx) { obj.id }
  end

  field :created_at, types.String

  field :name, types.String
  field :description, types.String

  connection :members, UserType.connection_type do
    resolve -> (obj, args, ctx) {
      obj.members
    }
  end
end
