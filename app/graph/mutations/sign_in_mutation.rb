SignInMutation = GraphQL::Relay::Mutation.define do
  name "SignIn"
  input_field :email, !types.String
  input_field :password, !types.String

  return_field :access_token, types.String

  resolve -> (args, ctx) {
    @user = User.find_for_database_authentication(email: args[:email])
    return {access_token: nil} unless @user

    if @user.valid_password?(args[:password])
      sign_in :user, @user
      return {access_token: @user.access_token}
    else
      {access_token: nil}
    end
  }
end
