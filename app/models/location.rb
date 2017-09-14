class Location < ApplicationRecord
  # Associations
  belongs_to :group
  belongs_to :location, optional: true
  has_many :items, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :stock_items, through: :items
  has_many :item_expiries, through: :items
  attr_readonly :group_id
  attr_readonly :location_id

  # Auditing
  acts_as_paranoid
  audited

  # Validations
  validates :name, presence: true
end
