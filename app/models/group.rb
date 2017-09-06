class Group < ApplicationRecord
  belongs_to :group, optional: true
  has_many :groups
  has_many :locations

  validates :name, presence: true
end
