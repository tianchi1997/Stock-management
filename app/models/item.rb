class Item < ApplicationRecord
  belongs_to :location
  belongs_to :stock_item
  has_many :item_expiries, dependent: :destroy

  validates :required, presence: true
end
