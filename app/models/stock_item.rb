class StockItem < ApplicationRecord
  # Associations
  has_many :items, dependent: :destroy
  has_many :item_expiries, through: :items
  has_many :locations, through: :items

  # Auditing
  acts_as_paranoid
  audited

  # Validations
  validates :name, presence: true
  validates :item_code, presence: true
  validates :expires, inclusion: { in: [ true, false ] }
  validates_associated :item_expiries

  # Virtual Attributes
  attribute :total, :integer
  attribute :required, :integer
  attribute :order_to, :integer

  def self.summary(stock_items)
    return stock_items
      .joins(items: [:item_expiries])
      .select("stock_items.*, SUM(items.required) as required, SUM(COALESCE(items.order_to, items.required)) as order_to, SUM(item_expiries.count) as total")
      .group(:id)
  end
end
