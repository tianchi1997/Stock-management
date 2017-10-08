require "rails_helper"

RSpec.describe ReportsController, type: :routing do
  describe "routing" do
    it "routes to #location with id" do
      expect(get: "/locations/1/report").to route_to("reports#location", id: "1")
    end

    it "routes to #location" do
      expect(get: "/report").to route_to("reports#location")
    end
  end
end
