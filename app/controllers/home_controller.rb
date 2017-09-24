class HomeController < ApplicationController
  # No authorisation required
  skip_authorization_check

  def index
  end
end
