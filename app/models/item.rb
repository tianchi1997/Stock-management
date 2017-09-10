class Item < ApplicationRecord
  # Associations
  belongs_to :location
  belongs_to :stock_item
  has_many :item_expiries, dependent: :destroy

  # Auditing
  acts_as_paranoid
  audited
  has_associated_audits

  # Validations
  validates :required, presence: true
end
