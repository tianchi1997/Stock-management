require "rails_helper"

RSpec.describe StockTakeController, type: :routing do
  describe "routing" do
    it "routes to #location" do
      expect(get: "/locations/1/stock_take").to route_to("stock_take#location", id: "1")
    end
  end
end
