require './lib/omniauth/facebook.rb'

FacebookLoginMutation = GraphQL::Relay::Mutation.define do
  name "FacebookLogin"
  input_field :authorization_code, !types.String

  return_field :access_token, !types.String

  resolve -> (args, ctx) {
    user_info, fb_access_token = Omniauth::Facebook.authenticate(args[:authorization_code])
    identity = Identity.find_or_create_for_oauth(uid: user_info["id"], provider: :facebook)

    # Create the user if needed
    if identity.user.nil?
      email = user_info["email"]
      user = User.find_by(email: email) if email
      # Create the user if it's a new registration
      if user.nil?
        user = User.create(
          fullname: user_info["name"],
          email: email,
          username: email,
          password: Devise.friendly_token[0,20]
        )
      end

      identity.user = user
      identity.save!
    end

    {access_token: identity.user.access_token}
  }
end
