class CreateTeamFormCheckVisibilities < ActiveRecord::Migration
  def change
    create_table :team_form_check_visibilities do |t|
      t.belongs_to :team, index: true
      t.belongs_to :base_visibility, index: true
      t.timestamps null: false
    end
  end
end
