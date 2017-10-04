class StockItemSummary < ApplicationRecord
  belongs_to :location
  belongs_to :stock_item

  def readonly?
    true
  end
end
