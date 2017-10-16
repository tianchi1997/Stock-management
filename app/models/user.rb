class User < ApplicationRecord
  # Devise authentication
  devise :database_authenticatable, :lockable, :recoverable,
         :rememberable, :timeoutable, :trackable, :validatable

  # Auditing
  acts_as_paranoid
  audited

  # Validations
  validates :name, presence: true
  validates :permission_level, presence: true

  # Scope
  default_scope { order(name: :asc) }

  def permission_level_string
    if permission_level >= 2
      "Admin"
    elsif permission_level >= 1
      "Report User"
    else
      "User"
    end
  end
end
