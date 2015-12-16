class CreateFormChecks < ActiveRecord::Migration
  def change
    create_table :form_checks do |t|
      t.string :title
      t.integer :sport_id
      t.text :description
      t.integer :video_url

      t.timestamps null: false
    end
  end
end
