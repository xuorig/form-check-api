class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :sport_id
      t.string :description

      t.timestamps null: false
    end
  end
end
