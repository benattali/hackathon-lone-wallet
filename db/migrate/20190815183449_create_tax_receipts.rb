class CreateTaxReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :tax_receipts do |t|
      t.integer :number
      t.references :donation, foreign_key: true

      t.timestamps
    end
  end
end
