class CreateProjectStatusChanges < ActiveRecord::Migration[8.0]
  def change
    create_table :project_status_changes do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
    add_index :project_status_changes, :status
  end
end
