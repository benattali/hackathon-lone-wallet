class Donation < ApplicationRecord
  belongs_to :user
  has_many :tax_receipts
  has_many :soldiers_donations
  has_many :donated_soldiers, through: :soldiers_donations, source: :user
end
