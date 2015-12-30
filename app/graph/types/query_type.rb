# type Query {
# }
QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"
  field :node, field: NodeIdentification.field
  field :viewer do
    type ViewerType
    resolve -> (obj, args, ctx) { Viewer.new }
  end
end
