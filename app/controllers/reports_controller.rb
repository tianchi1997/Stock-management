require 'csv'

class ReportsController < ApplicationController
  authorize_resource class: false # Authorise actions

  def location
    # Set instance variables from parameters
    @global = true
    @order_to = params[:order_to]
    @expiries = params[:expiries]
    @display_tree = params[:display_tree]
    @location = nil

    # If report on a specific location
    if params[:id]
      # Set variables required for location report and add breadcrumbs
      @global = false
      @location = Location.preload(stock_item_summaries: [:stock_item]).find(params[:id])
      locations = @location.subtree
      add_location_breadcrumb @location
      add_breadcrumb "Report", location_report_path(@location)
    else
      # Set variables required for global report and add breadcrumbs
      locations = Location.all.preload(stock_item_summaries:[:stock_item])
      @stock_item_summaries = StockItemSummary.where(location: nil).preload(:stock_item)
      add_breadcrumb "Report", :report_path
    end

    if @display_tree
      # Load summaries and child items on all children locations
      locations = locations.preload(stock_item_summaries: [:stock_item]).preload(items: [:stock_item, :item_summary])

      # Load expiries if expiries should be displayed
      if @expiries
        locations = locations.preload(items: [:item_expiries])
      end

      # Arrange locations into a tree
      @location_tree = locations.arrange(order: [:position, :name, :id])
    end
  end
end
