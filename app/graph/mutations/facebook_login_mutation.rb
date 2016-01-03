require './lib/omniauth/facebook.rb'

FacebookLoginMutation = GraphQL::Relay::Mutation.define do
  name "FacebookLogin"
  input_field :authorization_code, !types.String

  return_field :access_token, !types.String

  resolve -> (args, ctx) {
    user_info, access_token = Omniauth::Facebook.authenticate(args[:authorization_code])
    byebug
  }
end
