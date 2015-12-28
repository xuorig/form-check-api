class AddThumbnailToFormCheck < ActiveRecord::Migration
  def change
    add_column :form_checks, :thumbnail_url, :string
  end
end
