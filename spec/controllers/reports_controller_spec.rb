require 'rails_helper'
require 'support/devise'

RSpec.describe ReportsController, type: :controller do
  login_report
  describe "GET #location" do
    it "returns http success" do
      get :location
      expect(response).to have_http_status(:success)
    end

    describe "Variable Assignments" do 
      before(:each) do
        get :location , params: {id: location.to_param, order_to: true, expiries: true, display_tree: true}
      end
      let(:location) {create(:location)}
     

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

      it "assigns locations to be location subtree" do
        expect(assigns(:location_tree)).to eq(location.subtree)
      end
    end
  end
end
