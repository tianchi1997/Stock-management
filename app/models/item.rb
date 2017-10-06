class Item < ApplicationRecord
  # Associations
  belongs_to :location
  belongs_to :stock_item
  has_many :item_expiries, dependent: :destroy
  attr_readonly :location_id
  attr_readonly :stock_item_id

  has_one :item_summary

  # Auditing
  acts_as_paranoid
  audited
  has_associated_audits

  # Validations
  validates :required, presence: true, numericality: { greater_than: 0 }
  validates :order_to, numericality: { greater_than_or_equal_to: :required }, allow_nil: true
end
