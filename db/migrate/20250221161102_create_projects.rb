class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :status

      t.timestamps
    end
    add_index :projects, :status
  end
end
