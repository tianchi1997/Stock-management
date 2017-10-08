class ItemSummary < ApplicationRecord
  # Associations
  belongs_to :item
  belongs_to :location
  belongs_to :stock_item

  # Amount to order
  def order_amount
    if total >= required
      return 0
    else
      return order_to - total
    end
  end

  # Model cannot be changed
  def readonly?
    true
  end
end
