class ItemSummary < ApplicationRecord
  belongs_to :item
  belongs_to :location
  belongs_to :stock_item

  def readonly?
    true
  end
end
