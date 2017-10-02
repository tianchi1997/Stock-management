class ReportsController < ApplicationController
  authorize_resource class: false

  def location
    add_location_breadcrumb Location.find(params[:id])
    add_breadcrumb "Report", location_report_path(params[:id])

    
    @location = Location.find(params[:id])
    @stock_items = StockItem.summary(StockItem.all).where(items: {location: @location.subtree}).order(:name)

  end

  def stock_item
    @stock_item = StockItem.find(params[:id])
    add_breadcrumb @stock_item.name, stock_item_path(@stock_item)
    add_breadcrumb "Report", stock_item_report_path(params[:id])
  end
end
