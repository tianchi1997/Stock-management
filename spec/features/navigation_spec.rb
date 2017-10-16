require 'rails_helper'

RSpec.feature "Navigation", type: :feature ,js: true do
  
  before(:each) do
    login_as(FactoryGirl.create(:admin))
  end
  let!(:parent) {FactoryGirl.create(:location)}
  let!(:location) {FactoryGirl.create(:location, parent: parent)}
  let!(:location2) {FactoryGirl.create(:location, parent: parent)}
  scenario "Navigate from current location to a breadcrumb" do
    

    visit "/locations/#{location.to_param}"
    #verify we are on the location's page
    expect(page).to have_text(location.name)
    expect(page).to have_text(location.description)

    click_link(location.parent_name)
    #verify we are on the parent page now
    expect(page).to have_text(location.parent_name)
    expect(page).to_not have_text(location.description)
    expect(page).to have_text(parent.description)

  end
  scenario "Navigate to a sublocation from a location"do
    visit "/locations/#{parent.to_param}"
    # Verify we are on the parent page
    expect(page).to have_text(parent.name)
    expect(page).to_not have_text(location.description)
    expect(page).to have_text(parent.description)

    click_on(location.name)  

    expect(page).to have_text(location.name)
    expect(page).to have_text(location.description)
    expect(page).to_not have_text(parent.description)



  end
  scenario "Navigate from location to Home page" do
    visit "/locations/#{location.to_param}"
    #verify we are on the location's page
    expect(page).to have_text(location.name)
    expect(page).to have_text(location.description)

    click_link("Home")
    expect(page).to have_text("Home")
    expect(page).to have_text("Stock Items")
    expect(page).to have_text("Locations")
    expect(page).to have_text("Users")
    


  end
  scenario "Navigate from stock items page to home page" do
    visit"/stock_items"
    expect(page).to have_text("New Stock Item")

    click_link("Home")
    expect(page).to have_text("Home")
    expect(page).to have_text("Stock Items")
    expect(page).to have_text("Locations")
    expect(page).to have_text("Users")
    
  end
  scenario "Navigate to stock items page from home page" do

skip("Potatoes")

    
  end
  scenario "Navigate to locations page from home page" do

skip("Potatoes")

    
  end
  scenario "Navigate to location of an item from item page" do

skip("Potatoes")
  end

end
