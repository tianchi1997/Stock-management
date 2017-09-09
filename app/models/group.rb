class Group < ApplicationRecord
  belongs_to :group, optional: true
  has_many :groups, dependent: :destroy
  has_many :locations, dependent: :destroy

  validates :name, presence: true
end
