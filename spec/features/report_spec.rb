require 'rails_helper'

RSpec.feature "Report", type: :feature do
  before(:each) do
    login_as(FactoryGirl.create(:user))
  end

  scenario "Report" do
    visit "/"
    expect(page).to have_text("Locations")
  end
end
