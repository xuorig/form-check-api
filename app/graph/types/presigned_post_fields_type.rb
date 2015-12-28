PresignedPostFieldsType = GraphQL::ObjectType.define do
  name "PresignedPostFields"
  interfaces [NodeIdentification.interface]
  global_id_field :id
  description "A Team"

  field :key, types.String
  field :success_action_status, types.String
  field :acl, types.String
  field :policy, types.String
  field :x_amz_credential, types.String
  field :x_amz_algorithm, types.String
  field :x_amz_date, types.String
  field :x_amz_signature, types.String
end
