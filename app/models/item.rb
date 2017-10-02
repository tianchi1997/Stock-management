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

  def self.summary(items)
    return items
      .joins("LEFT JOIN item_expiries on items.id = item_expiries.item_id")
      .select("items.*, COALESCE(SUM(item_expiries.count), 0) as total")
      .group("items.id, stock_items.id, locations.id")
      .eager_load(:stock_item, :location)
  end
end
