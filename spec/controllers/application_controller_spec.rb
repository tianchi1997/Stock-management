require 'rails_helper'
require 'support/devise'

RSpec.describe ApplicationController, type: :controller do
  login_user

  controller do
    authorize_resource class: false
    def index
      redirect_to "/"
    end
  end

  describe "request page without permission" do
    it "redirects to 403 page" do
      allow(controller).to receive(:authorize!) { raise CanCan::AccessDenied }
      get :index
      expect(response).to have_http_status(403)
    end
  end
end
