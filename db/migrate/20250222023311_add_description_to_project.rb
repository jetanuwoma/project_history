class AddDescriptionToProject < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :description, :text, null: true
  end
end
