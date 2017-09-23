class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_stock_items, only: [:new, :edit, :create, :update]

  # GET /items/1
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    if params[:location_id]
      @item.location_id = params[:location_id]
      add_location_breadcrumb @item.location
      add_breadcrumb "New Item", new_item_path(location_id: params[:location_id])
    end
  end

  # GET /items/1/edit
  def edit
    add_breadcrumb "Edit", edit_item_path(@item)
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
      add_location_breadcrumb @item.location
      add_breadcrumb @item.stock_item.name, item_path(@item)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:location_id, :stock_item_id, :required, :order_to)
    end

    def set_stock_items
      @stock_items = StockItem.all.order(:name)
    end
end
