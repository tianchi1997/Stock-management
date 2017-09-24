class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_breadcrumb "Home", :root_path

  protected
  def add_location_breadcrumb(location)
    locations = []
    while location != nil
      locations.push(location)
      location = location.location
    end

    locations.reverse.each do |location|
      add_breadcrumb location.name, location_path(location)
    end
  end
end
