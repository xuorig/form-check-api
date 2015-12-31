class TeamVisibility < BaseVisibility
  has_many :team_form_check_visibilities
  has_many :teams, through: :team_form_check_visibilities

  def visible_by(user)
    self.teams.all? { |team| user.memberships.include?(team) }
  end
end
