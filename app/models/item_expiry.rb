class ItemExpiry < ApplicationRecord
  # Assocations
  belongs_to :item
  has_one :stock_item, through: :item

  # Auditing
  acts_as_paranoid
  audited associated_with: :item

  # Validations
  validates :count, presence: true
  validate :expiry_date_valid

  private
  def expiry_date_valid
    if stock_item.expires && expiry_date == nil
        errors.add(:expiry_date, "is not allowed unless stock item does not expire")
    elsif !stock_item.expires && expiry_date != nil
        errors.add(:expiry_date, "is not allowed unless stock item expires")
    end
  end
end
