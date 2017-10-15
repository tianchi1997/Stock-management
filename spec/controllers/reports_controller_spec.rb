require 'rails_helper'
require 'support/devise'

RSpec.describe ReportsController, type: :controller do
  login_report
  describe "GET #location" do
    it "returns http success" do
      get :location
      expect(response).to have_http_status(:success)
    end

    describe "Variable Assignments, Display tree Ture " do 
      let(:location) {create(:location)}

      before(:each) do
        get :location , params: {id: location.to_param, order_to: true, expiries: true, display_tree: true}

      end

      it "assigns @order to to true" do
        expect(assigns(:order_to)).to be_truthy
      end
      it "assigns expiries to be true" do
        expect(assigns(:expiries)).to be_truthy
      end
      it "assigns @global to be false" do
        expect(assigns(:global)).to be_falsey
      end
      it "assigns @location correctly" do
        expect(assigns(:location)).to eq(Location.find(location.to_param))
      end
      it "assigns @display_tree correctly" do
        expect(assigns(:display_tree)).to be_truthy
      end
      it "assigns locations to be location subtree" do
        expect(assigns(:location_tree)).to eq(Location.find(location.to_param).subtree.arrange(order: [:position, :name, :id]))
      end
    end

    describe "Variable Assignments, Display tree false " do 
      let(:location) {create(:location)}

      before(:each) do
        get :location , params: {id: location.to_param}

      end

      it "assigns @order to to false" do
        expect(assigns(:order_to)).to be_falsey
      end
      it "assigns expiries to be false" do
        expect(assigns(:expiries)).to be_falsey
      end
      it "assigns @global to be false" do
        expect(assigns(:global)).to be_falsey
      end
      it "assigns @location correctly" do
        expect(assigns(:location)).to eq(Location.find(location.to_param))
      end
      it "assigns @display_tree correctly" do
        expect(assigns(:display_tree)).to be_falsey
      end
    end
    
    describe "Global Report variable assignments" do
      let(:location) {create(:location)}

      before(:each) do
        get :location , params: {display_tree: true}

      end
      it "assigns @order to to false" do
        expect(assigns(:order_to)).to be_falsey
      end
      it "assigns expiries to be false" do
        expect(assigns(:expiries)).to be_falsey
      end
      it "assigns @global to be true" do
        expect(assigns(:global)).to be_truthy
      end
      it "assigns @display_tree correctly" do
        expect(assigns(:display_tree)).to be_truthy
      end
      it "assigns @stock_item_summaries to be summary"do
        expect(assigns(:stock_item_summaries)).to eq(StockItemSummary.where(location: nil).preload(:stock_item))
      end
      it "assigns locations to be global tree" do
        expect(assigns(:location_tree)).to eq(Location.all.arrange(order: [:position, :name, :id]))
      end
    end
  end
end
