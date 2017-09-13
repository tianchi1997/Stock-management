require "rails_helper"

RSpec.describe ItemExpiriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/item_expiries").to route_to("item_expiries#index")
    end

    it "routes to #new" do
      expect(:get => "/item_expiries/new").to route_to("item_expiries#new")
    end

    it "routes to #show" do
      expect(:get => "/item_expiries/1").to route_to("item_expiries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/item_expiries/1/edit").to route_to("item_expiries#edit", :id => "1")
    end

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
