class CreateBaseVisibilities < ActiveRecord::Migration
  def change
    create_table :base_visibilities do |t|
      t.string :type
      t.string :name
      t.belongs_to :form_check
      t.belongs_to :team
      t.timestamps null: false
    end
  end
end
