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
    expect(page).to have_text("Stock Management System")
    expect(page).to have_text("Stock Items")
    expect(page).to have_text("Locations")
    expect(page).to have_text("Users")
    


  end
  scenario "Navigate from stock items page to home page" do
    visit"/stock_items"
    expect(page).to have_text("New Stock Item")

    click_link("Home")
    expect(page).to have_text("Stock Management System")
    expect(page).to have_text("Stock Items")
    expect(page).to have_text("Locations")
    expect(page).to have_text("Users")
    
  end
  scenario "Navigate to stock items page from home page" do
    visit '/'
    expect(page).to have_text("Stock Management System")
    expect(page).to have_text("Stock Items")
    expect(page).to have_text("Locations")
    expect(page).to have_text("Users")

    click_link("Stock Items")

    expect(page).to have_text("New Stock Item")
    
  end
  scenario "Navigate to locations page from home page" do
    visit '/'
    expect(page).to have_text("Stock Management System")
    expect(page).to have_text("Stock Items")
    expect(page).to have_text("Locations")
    expect(page).to have_text("Users")

    click_link("Locations")

    expect(page).to have_text("New Location")
    
  end
  scenario "Navigate to location of an item from item page" do
    stock_item1 = create(:stock_item, expires: false)
    stock_item2 = create(:stock_item, expires: false)
    item1=create(:item, location: location , stock_item: stock_item1 , required: 5)
    item2=create(:item, location: location , stock_item: stock_item2 , required: 5)
    item3=create(:item, location: location2 , stock_item: stock_item1 , required: 5)
    item4=create(:item, location: location2 , stock_item: stock_item2 , required: 5)

    visit "/stock_items/#{stock_item1.to_param}"

    #expect(page).to have_text(location.name)
    find('tr',text: location.name).click

    #verify we are on the new page 
    expect(page).to have_text("Audits")

  end

end
