class ItemExpiriesController < ApplicationController
  load_and_authorize_resource

  before_action :set_item_expiry, only: [:update, :destroy]

  # POST /item_expiries.json
  def create
    @item_expiry = ItemExpiry.new(item_expiry_params)

    if @item_expiry.save
      head :ok
    else
      render json: @item_expiry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_expiries/1.json
  def update
    if @item_expiry.update(item_expiry_params)
      head :ok
    else
      render json: @item_expiry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_expiries/1.json
  def destroy
    @item_expiry.destroy
    head :no_content
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
