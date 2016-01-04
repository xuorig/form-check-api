class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_or_create_for_oauth(uid:, provider:)
    find_or_create_by(uid: uid, provider: provider)
  end
end
