class ReportsController < ApplicationController
  authorize_resource class: false

  def location
    @location = Location.find(params[:id])
    add_location_breadcrumb @location
    add_breadcrumb "Report", location_report_path(params[:id])

    @item = @location.items
    @gr_item = @item.group(:stock_item_id)
  end

  def stock_item
    @stock_item = StockItem.find(params[:id])
    add_breadcrumb @stock_item.name, stock_item_path(@stock_item)
    add_breadcrumb "Report", stock_item_report_path(params[:id])
  end
end
