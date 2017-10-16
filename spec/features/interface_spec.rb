require 'rails_helper'

RSpec.feature "Interface", type: :feature, js: true do
  before(:each) do
    login_as(FactoryGirl.create(:admin))
  end

  let!(:parent) {FactoryGirl.create(:location)}
  let!(:location) {FactoryGirl.create(:location, parent: parent)}
  let!(:item1) {FactoryGirl.create(:item, location: location, required: 5)}
  let!(:stock_item) {FactoryGirl.create(:stock_item)}

  scenario "Numpad renders on stock take page with correct buttons" do 
    visit "/locations/#{location.to_param}/stock_take"
    within('#numpad') do
      values = page.all(:css, "input").map {|el| el.value}

      expect(values).to match_array(["1", "2", "3", "4", "5",
                                     "6", "7", "8", "9", "0",
                                     "C", "←", "-", "+",
                                     "Previous", "Next"
      ])
    end
  end

  scenario "Breadcrumbs render correctly on each page" do
    visit "/"
    expect(page).to have_text("Home")

    visit "/locations/"
    expect(page).to have_text("Home")
    expect(page).to have_text("Locations")

    visit "/locations/#{parent.to_param}"
    expect(page).to have_text("Home")
    expect(page).to have_text("Locations")
    expect(page).to have_text(parent.name)

    visit "/locations/#{location.to_param}"
    expect(page).to have_text("Home")
    expect(page).to have_text("Locations")
    expect(page).to have_text(parent.name)
    expect(page).to have_text(location.name)

    visit "/locations/#{location.to_param}/edit"
    expect(page).to have_text("Home")
    expect(page).to have_text("Locations")
    expect(page).to have_text(parent.name)
    expect(page).to have_text(location.name)
    expect(page).to have_text("Edit")

    visit "/locations/#{location.to_param}/new"
    expect(page).to have_text("Home")
    expect(page).to have_text("Locations")
    expect(page).to have_text(parent.name)
    expect(page).to have_text(location.name)
    expect(page).to have_text("New")

    visit "/items/#{item.to_param}"
    expect(page).to have_text("Home")
    expect(page).to have_text("Locations")
    expect(page).to have_text(parent.name)
    expect(page).to have_text(location.name)
    expect(page).to have_text(item.stock_item.name)

    visit "/items/#{item.to_param}/edit"
    expect(page).to have_text("Home")
    expect(page).to have_text("Locations")
    expect(page).to have_text(parent.name)
    expect(page).to have_text(location.name)
    expect(page).to have_text(item.stock_item.name)
    expect(page).to have_text("Edit")
  end
end
