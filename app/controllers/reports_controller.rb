class ReportsController < ApplicationController
  authorize_resource class: false

  def location
    @global = true
    @order_to = params[:order_to]
    @expiries = params[:expiries]
    @display_tree = params[:display_tree]
    @location = nil

    if params[:id]
      @global = false
      @location = Location.preload(stock_item_summaries:[:stock_item]).find(params[:id])
      locations = @location.subtree
      add_location_breadcrumb @location
      add_breadcrumb "Report", location_report_path(@location)
    else
      locations = Location.all
      add_breadcrumb "Report", :report_path
    end

    if @display_tree
      locations = locations.preload(stock_item_summaries: [:stock_item]).preload(items: [:stock_item, :item_summary])

      if @expiries
        locations = locations.preload(items: [:item_expiries])
      end

      @location_tree = locations.arrange(order: [:position, :name, :id])
    end
  end
end
