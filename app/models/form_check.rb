class FormCheck < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :comments
  belongs_to :user
  has_one :visibility, :class_name => "BaseVisibility", :foreign_key => "form_check_id"
  delegate :visible_by, to: :visibility


  def sport
    Sport.find(self.sport_id)
  end

  def mouvement
    Mouvement.find(self.mouvement_id)
  end
end
