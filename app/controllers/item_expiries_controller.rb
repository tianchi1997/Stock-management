class ItemExpiriesController < ApplicationController
  before_action :set_item_expiry, only: [:show, :edit, :update, :destroy]

  # GET /item_expiries
  # GET /item_expiries.json
  def index
    @item_expiries = ItemExpiry.all
  end

  # GET /item_expiries/1
  # GET /item_expiries/1.json
  def show
  end

  # GET /item_expiries/new
  def new
    @item_expiry = ItemExpiry.new
  end

  # GET /item_expiries/1/edit
  def edit
  end

  # POST /item_expiries
  # POST /item_expiries.json
  def create
    @item_expiry = ItemExpiry.new(item_expiry_params)

    respond_to do |format|
      if @item_expiry.save
        format.html { redirect_to @item_expiry, notice: 'Item expiry was successfully created.' }
        format.json { render :show, status: :created, location: @item_expiry }
      else
        format.html { render :new }
        format.json { render json: @item_expiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_expiries/1
  # PATCH/PUT /item_expiries/1.json
  def update
    respond_to do |format|
      if @item_expiry.update(item_expiry_params)
        format.html { redirect_to @item_expiry, notice: 'Item expiry was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_expiry }
      else
        format.html { render :edit }
        format.json { render json: @item_expiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_expiries/1
  # DELETE /item_expiries/1.json
  def destroy
    @item_expiry.destroy
    respond_to do |format|
      format.html { redirect_to item_expiries_url, notice: 'Item expiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_expiry
      @item_expiry = ItemExpiry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_expiry_params
      params.require(:item_expiry).permit(:item_id, :expiry_date, :count)
    end
end
