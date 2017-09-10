class Group < ApplicationRecord
  # Associations
  belongs_to :group, optional: true
  has_many :groups, dependent: :destroy
  has_many :locations, dependent: :destroy
  attr_readonly :group_id

  # Auditing
  acts_as_paranoid
  audited

  # Validations
  validates :name, presence: true
end
