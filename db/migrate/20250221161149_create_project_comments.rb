class CreateProjectComments < ActiveRecord::Migration[8.0]
  def change
    create_table :project_comments do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.integer :parent_id

      t.timestamps
    end
    add_index :project_comments, :parent_id
  end
end
