class ItemExpiry < ApplicationRecord
  # Assocations
  belongs_to :item
  has_one :stock_item, through: :item
  has_one :location, through: :item
  attr_readonly :item_id

  # Auditing
  acts_as_paranoid
  audited associated_with: :item

  # Validations
  validates :count, presence: true
  validate :expiry_date_valid

  # Scopes
  scope :ordered, -> { order(expiry_date: :asc) }

  private
  def expiry_date_valid
    if expiry_date != nil && expiry_date.past?
      errors.add(:expiry_date, "cannot be in the past")
    end

    if item.stock_item.expires && expiry_date == nil
      errors.add(:expiry_date, "must be set if stock item expires")
    elsif !item.stock_item.expires && expiry_date != nil
      errors.add(:expiry_date, "must not be set if stock item does not expire")
    end
  end
end
