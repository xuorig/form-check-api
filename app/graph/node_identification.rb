NodeIdentification = GraphQL::Relay::GlobalNodeIdentification.define do
  # Given a UUID & the query context,
  # return the corresponding application object
  object_from_id -> (id, ctx) do
    type_name, id = NodeIdentification.from_global_id(id)
    return Viewer.new if type_name == 'Viewer'
    return PresignedPost.new if type_name == 'PresignedPost'
    return PresignedPostFields.new if type_name == 'PresignedPostFields'

    type_name.constantize.find(id)
  end

  # Given an application object,
  # return a GraphQL ObjectType to expose that object
  type_from_object -> (object) do
    FormCheckSchema.types[object.class.name]
  end
end
