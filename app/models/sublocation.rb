class Sublocation < ApplicationRecord
    belongs_to :location, optional: true
    belongs_to :sublocation, optional: true
    has_many :stock_items
end
