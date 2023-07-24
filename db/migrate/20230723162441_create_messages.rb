class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :text, null: false
      t.string :name, null: false
      t.references :event_date, null: false, foreign_key: true
      t.timestamps
    end
  end
end
