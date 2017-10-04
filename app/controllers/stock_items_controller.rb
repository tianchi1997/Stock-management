class StockItemsController < ApplicationController
  load_and_authorize_resource

  add_breadcrumb "Stock Items", :stock_items_path
  before_action :set_stock_item, only: [:edit, :update, :destroy]

  # GET /stock_items
  def index
    @stock_items = StockItem.all.preload(:stock_item_summary)
  end

  # GET /stock_items/1
  def show
    @stock_item = StockItem.preload(items: [:item_summary, :location]).find(params[:id])
  end

  # GET /stock_items/new
  def new
    @stock_item = StockItem.new
    add_breadcrumb "New", new_stock_item_path
  end

  # GET /stock_items/1/edit
  def edit
    add_breadcrumb "Edit", edit_stock_item_path(@stock_item)
  end

  # POST /stock_items
  def create
    @stock_item = StockItem.new(stock_item_params)

    if @stock_item.save
      redirect_to @stock_item, notice: 'Stock item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /stock_items/1
  def update
    if @stock_item.update(stock_item_params)
      redirect_to @stock_item, notice: 'Stock item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /stock_items/1
  def destroy
    @stock_item.destroy
    redirect_to stock_items_url, notice: 'Stock item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_item
      @stock_item = StockItem.find(params[:id])
      add_breadcrumb @stock_item.name, stock_item_path(@stock_item)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_item_params
      params.require(:stock_item).permit(:item_code, :name, :expires)
    end
end
