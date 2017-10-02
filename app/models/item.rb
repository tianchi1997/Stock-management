class Item < ApplicationRecord
  # Associations
  belongs_to :location
  belongs_to :stock_item
  has_many :item_expiries, dependent: :destroy
  attr_readonly :location_id
  attr_readonly :stock_item_id

  # Auditing
  acts_as_paranoid
  audited
  has_associated_audits

  # Validations
  validates :required, presence: true

  # Total Virtual Attribute
  attribute :total, :integer

  def self.summary_with_order(items, order)
    return items
      .joins("LEFT JOIN item_expiries on items.id = item_expiries.item_id")
      .select("items.*, SUM(item_expiries.count) as total")
      .group("items.id, stock_items.id, locations.id")
      .includes(:stock_item, :location)
      .order(order)
  end
end
