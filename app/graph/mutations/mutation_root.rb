MutationRoot = GraphQL::ObjectType.define do
  name "Mutation"
  description "The root for mutations in this schema"
  field :signup, field: SignUpMutation.field
  field :signin, field: SignInMutation.field
end