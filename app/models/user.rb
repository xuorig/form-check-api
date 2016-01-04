class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :form_checks

  has_many :team_memberships, class_name:  "TeamMembership",
                         foreign_key: "user_id",
                         dependent:   :destroy
  has_many :memberships, through: :team_memberships, source: :team


  after_create :update_access_token!

  def update_access_token!
    # Change that to something more secure (id)
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
  end

  def self.find_for_oauth(user_info, provider)

    # Get the identity and user if they exist
    identity = Identity.find_or_create_for_oauth(user_info["id"], provider)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.

    # Create the user if needed
    if identity.nil?
      email = user_info["email"]
      user = User.find_by(email: email) if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          #username: auth.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        user.skip_confirmation!
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

end
