class ItemExpiry < ApplicationRecord
  # Assocations
  belongs_to :item

  # Auditing
  acts_as_paranoid
  audited associated_with: :item

  # Validations
  validates :count, presence: true
  validate :expiry_date_valid

  private
  def expiry_date_valid
    if item.stock_item.expires && expires == nil
        errors.add(:expires, "is not allowed unless stock item does not expire")
    elsif !item.stock_item.expires && expires != nil
        errors.add(:expires, "is not allowed unless stock item expires")
    end
  end
end
