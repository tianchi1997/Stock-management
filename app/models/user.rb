class User < ApplicationRecord
  # Devise authentication
  devise :database_authenticatable, :lockable, :recoverable,
         :rememberable, :timeoutable, :trackable, :validatable

  # Auditing
  acts_as_paranoid
  audited
end
