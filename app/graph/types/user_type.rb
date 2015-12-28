UserType = GraphQL::ObjectType.define do
  name "User"
  interfaces [NodeIdentification.interface]
  description "A User"
  global_id_field :id

  field :email, !types.String
  field :username, !types.String

  field :profile_pic_url do
    type !types.String
    resolve -> (obj, args, ctx) { obj.profile_pic_url }
  end

  connection :formchecks do
    type -> { FormCheckType.connection_type  }
    resolve -> (obj, args, ctx) {
      obj.form_checks
    }
  end

  connection :memberships do
    type -> { TeamType.connection_type  }
    resolve -> (obj, args, ctx) {
      obj.memberships
    }
  end

  field :presigned_s3_post do
    type PresignedPostType
    resolve -> (obj, args, ctx) {
      PresignedPost.new
    }
  end
end
