class AddUserIdToUnits < ActiveRecord::Migration[6.0]
  def change
    add_reference :units, :user, null: false, foreign_key: true
  end
end
