class AddUserIdToFormCheck < ActiveRecord::Migration
  def change
    add_column :form_checks, :user_id, :integer
  end
end
