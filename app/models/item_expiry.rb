class ItemExpiry < ApplicationRecord
  # Assocations
  belongs_to :item
  has_one :stock_item, through: :item
  has_one :location, through: :item
  # Prevent item id from being updated which would break audits
  attr_readonly :item_id

  # Auditing
  # Has audits associated with an item
  audited associated_with: :item

  # Validations
  # Validate count more than 0
  validates :count, presence: true, numericality: { greater_than: 0 }
  # Validate expiry date
  validate :expiry_date_valid

  # Scopes
  scope :ordered, -> { order(expiry_date: :asc) }

  private
  # Validate expiry date
  def expiry_date_valid
    # Validate expiry date is not in past
    if expiry_date != nil && expiry_date.past?
      errors.add(:expiry_date, "cannot be in the past")
    end

    # Validate item has expiry if and only if stock item expiries
    if item.stock_item.expires && expiry_date == nil
      errors.add(:expiry_date, "must be set if stock item expires")
    elsif !item.stock_item.expires && expiry_date != nil
      errors.add(:expiry_date, "must not be set if stock item does not expire")
    end
  end
end
