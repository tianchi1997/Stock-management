require 'rails_helper'

RSpec.describe StockTakeController, type: :controller do
  describe "GET #location" do
    it "returns http success" do
      get :location
      expect(response).to have_http_status(:success)
    end
  end

end
