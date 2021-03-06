class ItemsController < ApplicationController
  load_and_authorize_resource # Authorise access to action

  # Set values before action
  before_action :set_item, only: [:show, :edit, :update, :destroy, :save_expiries, :audits]
  before_action :set_stock_items, only: [:new, :edit, :create, :update]

  # GET /items/1
  def show
    @item = Item.includes(:item_expiries).order("item_expiries.expiry_date").find(params[:id])
    @audits = @item.associated_audits.includes(:user).includes(:auditable).order(created_at: :desc)
  end

  # GET /items/new
  def new
    @item = Item.new

    # Set location and add to breadcrumb
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
    redirect_to location_path(@item.location), notice: 'Item was successfully destroyed.'
  end

  def save_expiries
    # Read JSON from HTTP request
    json = JSON.parse(request.body.read, symbolize_names: true)
    json = json.group_by { |expiry| expiry[:expiryDate] }
    item_expiries = []
    dates = []

    # Create new item expiries array
    json.each do |date, expiries|
      total = expiries.map { |expiry| expiry[:count] }.sum
      item_expiry = ItemExpiry.new(item: @item, expiry_date: date, count: total)
      item_expiries.push(item_expiry)
      dates.push(item_expiry.expiry_date)
    end

    # If all new item expiries are valid
    if item_expiries.all? { |item_expiry| item_expiry.valid? }
      ItemExpiry.where(item: @item).each do |item_expiry|
        if dates.include?(item_expiry.expiry_date)
          # Don't log expiry deletion if exist in new expiries
          item_expiry.delete
        else
          # Log expiry deletion if date doesn't exist in new expiries
          item_expiry.destroy
        end
      end

      item_expiries.each(&:save)
    end
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

    # Load stock items for form selection
    def set_stock_items
      @stock_items = StockItem.all.order(:name)
    end
end
