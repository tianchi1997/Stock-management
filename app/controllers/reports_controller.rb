class ReportsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
  end

  def locations
    @item = Location.find(params[:id]).items
    @gr_item = Location.find(params[:id]).items.group(:stock_item_id)
  end

  def stock_items
  end
end
