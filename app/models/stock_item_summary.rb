class StockItemSummary < ApplicationRecord
  has_one :location
  has_one :stock_item

  def readonly?
    true
  end
end
