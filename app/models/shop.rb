class Shop < ApplicationRecord
  has_many :user_shops, dependent: :destroy
  has_many :users, through: :user_shops
  has_many :collections, dependent: :destroy

  validates :name, presence: true
end
