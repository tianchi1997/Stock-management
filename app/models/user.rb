class User < ApplicationRecord
  # Devise authentication
  devise :database_authenticatable, :lockable, :recoverable,
         :rememberable, :timeoutable, :trackable, :validatable

  # Auditing
  acts_as_paranoid
  audited

  # Validations
  validates :permission_level, presence: true
end
