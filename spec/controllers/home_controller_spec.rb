require 'rails_helper'
require 'support/devise'

RSpec.describe HomeController, type: :controller do
  describe "Logged in" do
    login_user
    
    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end


      it "renders the :index view" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe "Not logged in" do
    describe "GET #index" do
      it "returns 302 found" do
        get :index
        expect(response).to have_http_status(302)
      end
    end
  end
end
