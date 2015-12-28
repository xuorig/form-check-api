class ChangeVideoUrlToString < ActiveRecord::Migration
  def change
    change_column :form_checks, :video_url, :string
  end
end
