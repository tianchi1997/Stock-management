class StockTakeController < ApplicationController
  authorize_resource class: false

  def location
    location = Location.find(params[:id])
    add_location_breadcrumb @location
    add_breadcrumb "Stock Take", stock_take_path(params[:id])
    @locations_ids = location.self_and_descendants.map { |loc| loc.id }
    logger.debug @location_ids
  end
end
