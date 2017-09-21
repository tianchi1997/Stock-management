class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_stock_items_and_locations, only: [:new, :edit]

  # GET /items
  def index
    @items = Item.all
  end

  # GET /items/1
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    if params[:location_id]
      @item.location_id = params[:location_id]
    end
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:location_id, :stock_item_id, :required, :order_to)
    end

    def set_stock_items_and_locations
      @locations = Location.all.order(:name)
      @stock_items = StockItem.all.order(:name)
    end
end
