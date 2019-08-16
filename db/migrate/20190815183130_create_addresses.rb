class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :address
      t.float :longitude
      t.float :latitude
      t.references :user, foreign_key: true
      t.integer :zip
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
