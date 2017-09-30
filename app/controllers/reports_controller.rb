class ReportsController < ApplicationController
  authorize_resource class: false

  def location
    #@items=Location.find(params[:id]).items.joins(:location).joins(:stock_item).joins(:item_expiries).where(location: Location.find(params[:id])).group(:stock_item).sum(:count)
    @items_table = Item.joins(:location).joins(:stock_item).joins(:item_expiries).where(location: Location.find(params[:id])).group("stock_items.id, items.id").order("stock_items.name").pluck("items.id, stock_items.name, SUM(item_expiries.count), items.required, items.order_to")

    add_location_breadcrumb Location.find(params[:id])
    add_breadcrumb "Report", location_report_path(params[:id])
    
    #if params[:order_to]
     # @location=item.joins(:location).joins(:stock_item).joins(:item_expiries).where(location: Location.find(params[:id])).group(:stock_item).sum(:count)
    #end
    #if params[:expiry]
    #  @location=item.joins(:location).joins(:stock_item).joins(:item_expiries).where(location: Location.find(params[:id]),:expires => (params[:expires]).group(:stock_item).sum(:count)
    #end

    #@item=@location.items
    #@gr_item=item.group(:stock_item_id)

  end

  def stock_item
    @stock_item = StockItem.find(params[:id])
    add_breadcrumb @stock_item.name, stock_item_path(@stock_item)
    add_breadcrumb "Report", stock_item_report_path(params[:id])
  end
end
