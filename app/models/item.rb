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

  def self.summary(items)
    return ItemExpiry.select("item_id, SUM(count) as count").where(item: items).group(:item_id).includes(item: [:stock_item, :location])
  end
end
