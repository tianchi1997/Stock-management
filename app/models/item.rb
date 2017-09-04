class Item < ApplicationRecord
  belongs_to :location
  belongs_to :stock_item
end
