class StockItem < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :name, presence: true
  validates :expires, inclusion: { in: [ true, false ] }
end
