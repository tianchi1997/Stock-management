class LocationsController < ApplicationController
  load_and_authorize_resource

  before_action :set_location, only: [:show, :edit, :update, :destroy]


  # GET /locations
  def index
    add_breadcrumb "Locations", :locations_path
    @locations_tree = Location.arrange(order: [:position, :name, :id])
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @locations_tree = @location.descendants.arrange(order: [:position, :name, :id])
    @items = Item.summary(@location.items).order("stock_items.name")
  end

  # GET /locations/new
  def new
    @location = Location.new
    if params[:parent_id]
      @location.parent = Location.find(params[:parent_id])
      add_location_breadcrumb @location.parent
    else
      add_breadcrumb "Locations", :locations_path
    end

    add_breadcrumb "New", new_location_path
  end

  # GET /locations/1/edit
  def edit
    add_breadcrumb "Edit", edit_location_path(@location)
  end

  # POST /locations
  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to @location, notice: 'Location was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /locations/1
  def update
    if @location.update(location_params)
      redirect_to @location, notice: 'Location was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /locations/1
  def destroy
    @location.destroy
    if @location.parent == nil
      redirect_to locations_url, notice: 'Location was successfully destroyed.'
    else
      redirect_to location_path(@location.parent), notice: 'Location was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
      add_location_breadcrumb @location
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:parent_id, :name, :position, :description)
    end
end
