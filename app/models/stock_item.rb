class StockItem < ApplicationRecord
  # Associations
  has_many :items, dependent: :destroy

  # Auditing
  acts_as_paranoid
  audited

  # Validations
  validates :name, presence: true
  validates :expires, inclusion: { in: [ true, false ] }
  validates_associated :items
end
