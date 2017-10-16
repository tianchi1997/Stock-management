require 'rails_helper'

RSpec.feature "StockCheck", type: :feature do
  before(:each) do
    login_as(FactoryGirl.create(:user), scope: :user)
  end

  scenario "User checks items at a location" do
    location = create(:location)
    item1 = create(:item, location: location)
    item2 = create(:item, location: location)
    item_expiry1 = create(:item_expiry, item: item1)
    item_expiry2 = create(:item_expiry, item: item1)

    visit "/locations/#{location.to_param}"
    expect(page).to have_text(location.name)

    expect(page).to have_text(item1.stock_item.name)
    expect(page).to have_text(item1.required)
    expect(page).to have_text(item1.order_to)
    expect(page).to have_text(item_expiry1.count + item_expiry2.count)

    expect(page).to have_text(item2.stock_item.name)
    expect(page).to have_text(item2.required)
    expect(page).to have_text(item2.order_to)
    expect(page).to have_text(0)
  end

  scenario "User checks expiry dates for an item" do
    item = create(:item, expires: true)
    item_expiry1 = create(:item_expiry, expires: true, item: item, expiry_date: Date.today + 5.days)
    item_expiry2 = create(:item_expiry, expires: true, item: item, expiry_date: Date.today + 2.days)

    visit "/items/#{item.to_param}"

    expect(page).to have_text(item.location.name)
    expect(page).to have_text(item.stock_item.name)
    expect(page).to have_text(item.required)
    expect(page).to have_text(item.order_to)
    expect(page).to have_text(item_expiry1.count + item_expiry2.count)

    expect(page).to have_text(item_expiry1.count)
    expect(page).to have_text(item_expiry2.count)
    expect(page).to have_text(item_expiry1.expiry_date.to_datetime.strftime("%F"))
    expect(page).to have_text(item_expiry2.expiry_date.to_datetime.strftime("%F"))
  end

  scenario "User checks all stock items" do
      
  end

  scenario "User checks a single stock item" do
    
  end
end

