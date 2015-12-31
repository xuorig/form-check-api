class TeamFormCheckVisibility < ActiveRecord::Base
  belongs_to :team
  belongs_to :base_visibility
end
