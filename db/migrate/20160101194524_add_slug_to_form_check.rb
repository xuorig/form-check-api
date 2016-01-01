class AddSlugToFormCheck < ActiveRecord::Migration
  def change
    add_column :form_checks, :slug, :string, unique: true
  end
end
