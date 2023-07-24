class AddUnitToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :unit, null: false, foreign_key: true
  end
end
