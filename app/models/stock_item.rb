class StockItem < ApplicationRecord
  # Associations
  has_many :items, dependent: :destroy
  has_many :item_expiries, through: :items
  has_many :locations, through: :items

  has_many :stock_item_summaries

  # Auditing
  acts_as_paranoid
  audited

  # Validations
  validates :name, presence: true
  validates :item_code, presence: true
  validates :expires, inclusion: { in: [ true, false ] }
  validates_associated :item_expiries
end
