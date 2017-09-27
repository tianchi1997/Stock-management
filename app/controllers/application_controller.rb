class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_breadcrumb "Home", :root_path

  check_authorization :unless => :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
  end

  protected
  def add_location_breadcrumb(location)
    add_breadcrumb "Locations", locations_path

    location.ancestors.each do |location|
      add_breadcrumb location.name, location_path(location)
    end
  end
end
