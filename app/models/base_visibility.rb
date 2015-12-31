class BaseVisibility < ActiveRecord::Base
  belongs_to :form_check

  def visible_by(user)
    raise NotImplementedError
  end
end
