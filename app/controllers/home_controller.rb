class HomeController < ApplicationController
  # No authorisation required
  skip_authorization_check

  # GET /
  def index
  end
end
