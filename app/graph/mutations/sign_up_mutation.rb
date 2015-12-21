SignUpMutation = GraphQL::Relay::Mutation.define do
  name "SignUp"
  input_field :email, !types.String
  input_field :username, !types.String
  input_field :fullname, !types.String
  input_field :password, !types.String

  return_field :access_token, types.String

  resolve -> (args, ctx) {
    user = User.create(
      email: args[:email],
      password: args[:password],
      fullname: args[:fullname],
      username: args[:username]
    )
    {access_token: user.access_token}
  }
end
