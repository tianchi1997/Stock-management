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

      it "assigns @order to to true" do
        get :location , params: {order_to: true}
        expect(assigns(:order_to)).to eq(true)
      end

      it "assigns @location to a new location" do
        expect(assigns(:location)).to be_a_new(Location)
      end


    end
  end
end
