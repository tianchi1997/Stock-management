class StockItem < ApplicationRecord
    belongs_to :sublocation
    has_many :items
end
