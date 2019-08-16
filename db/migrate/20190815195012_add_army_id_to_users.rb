class AddArmyIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :army_id, :integer
  end
end
