require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  describe "GET #location" do
    it "returns http success" do
      get :location
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #stock_item" do
    it "returns http success" do
      get :stock_item
      expect(response).to have_http_status(:success)
    end
  end

end
