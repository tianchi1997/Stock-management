class StockTakeController < ApplicationController
  authorize_resource class: false

  def location
    location = Location.find(params[:id])
    add_location_breadcrumb location
    add_breadcrumb "Stock Take", stock_take_path(params[:id])
    @locations = Location.sort_by_ancestry(location.subtree.order(:position, :name, :id))
  end
end
