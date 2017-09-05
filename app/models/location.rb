class Location < ApplicationRecord
    belongs_to :group
    belongs_to :location, optional: true
    has_many :locations
    has_many :stock_items
end
