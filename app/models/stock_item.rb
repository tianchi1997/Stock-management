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
      .joins(:items)
      .joins(%{
        INNER JOIN (
          SELECT item_id, count FROM item_expiries
          UNION ALL
          SELECT id, NULL FROM items
        ) item_expiries ON items.id = item_expiries.item_id
      })
      .select(%{
        stock_items.*,
        SUM(CASE WHEN count is NULL THEN items.required ELSE 0 END) as required,
        SUM(CASE WHEN count is NULL THEN COALESCE(items.order_to, items.required) ELSE 0 END) as order_to,
        COALESCE(SUM(count), 0) as total
      })
      .group(:id)
  end
end
