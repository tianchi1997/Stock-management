class ItemSummary < ApplicationRecord
  belongs_to :item
  belongs_to :location
  belongs_to :stock_item

  def order_amount
    if total >= required
      return 0
    else
      return order_to - total
    end
  end

  def readonly?
    true
  end
end
