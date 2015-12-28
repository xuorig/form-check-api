PresignedPostType = GraphQL::ObjectType.define do
  name "PresignedPost"
  interfaces [NodeIdentification.interface]
  global_id_field :id
  description "A presigned post for s3 upload"

  field :url, types.String
  field :fields do
    type PresignedPostFieldsType
    resolve -> (obj, args, ctx) { PresignedPostFields.new(obj.fields) }
  end
end
