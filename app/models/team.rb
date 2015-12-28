class Team < ActiveRecord::Base
  has_many :team_memberships, class_name:  "TeamMembership",
                         foreign_key: "team_id",
                         dependent:   :destroy
  has_many :members, through: :team_memberships, source: :user
end
