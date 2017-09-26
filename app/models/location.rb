class Location < ApplicationRecord
  # Associations
  belongs_to :location, optional: true
  has_many :items, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :stock_items, through: :items
  has_many :item_expiries, through: :items
  attr_readonly :location_id

  # Auditing
  acts_as_paranoid
  audited

  # Validations
  validates :name, presence: true

  # Scopes
  default_scope { order(:priority, :name) }

  scope :roots, -> { where(location: nil) }

  # Get parent name
  def parent_name
    location != nil ? location.name : "No Parent"
  end

  def self_and_descendants
    return ([self] + locations.map { |loc| loc.self_and_descendants}).flatten
  end
end

