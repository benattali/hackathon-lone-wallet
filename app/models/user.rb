class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :donations
  has_many :soldiers_donations
  accepts_nested_attributes_for :addresses

  before_save :army_id, presence: true, if: :is_soldier?

  enum role: [:soldier, :donor]

  def is_soldier?
    self.soldier?
  end
end

