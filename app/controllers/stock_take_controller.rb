class StockTakeController < ApplicationController
  def location
    @location = Location.find(params[:id])
    add_location_breadcrumb @location
    add_breadcrumb "Stock Take", stock_take_path(params[:id])
  end
end
