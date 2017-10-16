class StockItemSummary < ApplicationRecord
  # Associations
  belongs_to :location
  belongs_to :stock_item

  # Returns amount to be ordered
  def order_amount
    if total >= required
      return 0
    else
      return order_to - total
    end
  end

  # Model is read only
  def readonly?
    true
  end
end
