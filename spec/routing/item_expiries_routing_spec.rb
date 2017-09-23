require "rails_helper"

RSpec.describe ItemExpiriesController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(:post => "/item_expiries").to route_to("item_expiries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/item_expiries/1").to route_to("item_expiries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/item_expiries/1").to route_to("item_expiries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/item_expiries/1").to route_to("item_expiries#destroy", :id => "1")
    end
  end
end
