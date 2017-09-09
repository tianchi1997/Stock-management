class Location < ApplicationRecord
  # Associations
  belongs_to :group
  belongs_to :location, optional: true
  has_many :locations, dependent: :destroy
  has_many :items, dependent: :destroy

  # Auditing
  acts_as_paranoid
  audited

  # Validations
  validates :name, presence: true
end
