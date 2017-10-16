class ApplicationController < ActionController::Base
  before_action :authenticate_user! # Authenticate users before all actions
  add_breadcrumb "Home", :root_path # Add home breadcrumb to all pages

  # Check authorisation unless logging in
  check_authorization unless: :devise_controller? 

  # Render 403 if no permissions
  rescue_from CanCan::AccessDenied do |exception|
    render(file: File.join(Rails.root, 'public/403.html'), status: 403, layout: false)
  end

  protected
  # Location breadcrumb helper
  def add_location_breadcrumb(location)
    add_breadcrumb "Locations", locations_path

    # Add each location to breadcrumb
    location.path.each do |location|
      add_breadcrumb location.name, location_path(location)
    end
  end
end
