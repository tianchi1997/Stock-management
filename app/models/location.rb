class Location < ApplicationRecord
  # Associations
  has_many :items, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :stock_items, through: :items
  has_many :item_expiries, through: :items
  attr_readonly :parent_id

  # Auditing
  acts_as_paranoid
  audited

  # Validations
  validates :name, presence: true

  # Nested set
  acts_as_nested_set dependent: :destroy, order_column: :position

  # Get parent name
  def parent_name
    parent != nil ? parent.name : "No Parent"
  end
end

