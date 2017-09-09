class StockItem < ApplicationRecord
    has_many :items

    validates :name, presence: true
    validates :expires, inclusion: { in: [ true, false ] }
end
