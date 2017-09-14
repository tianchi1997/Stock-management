class StockTakeController < ApplicationController
  def index
  end

  def locations
    @location = Location.find(params[:id])
  end
end
