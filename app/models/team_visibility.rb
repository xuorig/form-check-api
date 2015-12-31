class TeamVisibility < BaseVisibility
  belongs_to :team

  def visible_by(user)
    user.memberships.include?(self.team)
  end
end
