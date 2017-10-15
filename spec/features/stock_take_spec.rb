require 'rails_helper'

RSpec.feature "StockTake", type: :feature, js: true do
  before(:each) do
    login_as(FactoryGirl.create(:user))
  end

  let!(:parent) {FactoryGirl.create(:location)}
  let!(:location1) {FactoryGirl.create(:location, parent: parent)}
  let!(:location2) {FactoryGirl.create(:location, parent: parent)}
  let!(:item1) {FactoryGirl.create(:item, location: location1, expires: true, required: 5)}
  let!(:item2) {FactoryGirl.create(:item, location: location2, required: 5, order_to: 10)}

  scenario "Stock Take with expiring items" do
    visit "/locations/#{location1.to_param}/stock_take"
    expect(page).to have_text(location1.name)
    expect(page).to have_text(location1.description)
    expect(page).to have_text(item1.stock_item.name)
    expect(page).to have_text(item1.required)
    expect(page).to have_text(item1.order_to)


  end

  scenario "Stock Take with non-expiring items" do

  end

  scenario "Stock Take on multiple locations" do

  end
  

end
