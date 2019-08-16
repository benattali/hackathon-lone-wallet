class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.references :user, foreign_key: true
      t.float :amount

      t.timestamps
    end
  end
end
