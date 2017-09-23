class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_breadcrumb "Home", :root_path

  def add_location_breadcrumb(location)
    add_breadcrumb "Locations", :locations_path
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
