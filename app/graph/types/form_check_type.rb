FormCheckType = GraphQL::ObjectType.define do
  name "FormCheck"
  interfaces [NodeIdentification.interface]
  global_id_field :id
  description "A Form Check"

  field :rails_id do
    type !types.Int
    resolve -> (obj, args, ctx) { obj.id }
  end

  field :created_at, types.String

  field :title, types.String
  field :description, types.String
end
