class ItemExpiry < ApplicationRecord
  belongs_to :item

  validates :count, presence: true
end
