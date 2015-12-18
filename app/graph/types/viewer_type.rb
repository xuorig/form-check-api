ViewerType = GraphQL::ObjectType.define do
  name "Viewer"
  interfaces [NodeIdentification.interface]
  description "Viewer ObjectType"
  global_id_field :id

  field :currentUser do
    type UserType
    resolve -> (obj, args, ctx) {
      ctx[:current_user]
    }
  end

  connection :formchecks, FormCheckType.connection_type do
    resolve -> (obj, args, ctx) {
      FormCheck.all
    }
  end
end
