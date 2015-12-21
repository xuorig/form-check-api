class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :form_checks

  after_create :update_access_token!
  
  def update_access_token!
    # Change that to something more secure (id)
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
  end
end
