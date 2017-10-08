class Item < ApplicationRecord
  # Associations
  belongs_to :location
  belongs_to :stock_item
  has_many :item_expiries, dependent: :destroy
  has_one :item_summary

  # Prevent location and stock item from changing
  attr_readonly :location_id
  attr_readonly :stock_item_id

  # Auditing
  acts_as_paranoid
  audited
  has_associated_audits

  # Validations
  # Validate item has a required value
  validates :required, presence: true, numericality: { greater_than: 0 }
  # Validates order to is above required
  validates :order_to, numericality: { greater_than_or_equal_to: :required }, allow_nil: true
end
