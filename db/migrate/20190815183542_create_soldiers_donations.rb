class CreateSoldiersDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :soldiers_donations do |t|
      t.references :donation, foreign_key: true
      t.references :user, foreign_key: true
      t.float :amount_per_soldier

      t.timestamps
    end
  end
end
