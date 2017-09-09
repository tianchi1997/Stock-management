class Location < ApplicationRecord
  belongs_to :group
  belongs_to :location, optional: true
  has_many :locations, dependent: :destroy
  has_many :items, dependent: :destroy

  validates :name, presence: true
end
