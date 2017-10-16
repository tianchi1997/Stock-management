class StockTakeController < ApplicationController
  authorize_resource class: false # Authorise access

  def location
    # Load location and add breadcrumbs
    location = Location.find(params[:id])
    add_location_breadcrumb location
    add_breadcrumb "Stock Take", stock_take_path(params[:id])

    # Arrange locations into DFS order
    @locations = Location.sort_by_ancestry(location.subtree.order(:position, :name, :id))
  end
end
