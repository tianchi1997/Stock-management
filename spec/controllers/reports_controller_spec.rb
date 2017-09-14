require 'rails_helper'

RSpec.describe ReportsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #locations" do
    it "returns http success" do
      get :locations
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #groups" do
    it "returns http success" do
      get :groups
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #stock_items" do
    it "returns http success" do
      get :stock_items
      expect(response).to have_http_status(:success)
    end
  end

end
