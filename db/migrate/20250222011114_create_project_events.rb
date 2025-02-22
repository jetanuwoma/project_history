class CreateProjectEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :project_events do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :eventable, polymorphic: true, null: false
      t.string :event_type
      t.jsonb :data

      t.timestamps
    end
  end
end
