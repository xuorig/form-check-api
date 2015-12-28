NodeIdentification = GraphQL::Relay::GlobalNodeIdentification.define do
  object_from_id -> (id) do
    type_name, id = NodeIdentification.from_global_id(id)
    return Viewer.new if type_name == 'Viewer'
    return PresignedPost.new if type_name == 'PresignedPost'
    return PresignedPostFields.new if type_name == 'PresignedPostFields'

    type_name.constantize.find(id)
  end

  type_from_object -> (object) do
    InsytoSchema.types[object.class.name]
  end
end
