require 'rails_helper'
require 'support/devise'

RSpec.describe StockTakeController, type: :controller do
  login_report
  
  describe "GET #location" do
    it "returns http success" do
      location = create(:location) 
      get :location, params: {id: location.to_param}
      expect(response).to have_http_status(:success)
    end

    it "gets location subtree" do
      location = create(:location) 
      locations = Location.sort_by_ancestry(location.subtree.order(:position, :name, :id))
      get :location, params: {id: location.to_param}
      assigns(:locations).should eq(locations) 
    end
  end
end
