class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :text, null: false
      t.string :name, null: false
      t.references :event_date, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true
      t.boolean :completed, null: false, default: false
      t.datetime :due_date, null: false
      t.timestamps
    end
  end
end
