class ItemExpiry < ApplicationRecord
  # Assocations
  belongs_to :item

  # Auditing
  acts_as_paranoid
  audited associated_with: :item

  # Validations
  validates :count, presence: true
end
