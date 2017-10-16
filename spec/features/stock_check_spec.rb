require 'rails_helper'

RSpec.feature "StockCheck", type: :feature do
  before(:each) do
    login_as(FactoryGirl.create(:user), scope: :user)
  end

  scenario "User checks items at a location" do
    location = create(:location)
    item1 = create(:item, location: location, expires: true)
    item2 = create(:item, location: location, expires: true)
    item_expiry1 = create(:item_expiry, item: item1, expires: true)
    item_expiry2 = create(:item_expiry, item: item1, expires: true)

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
    item_expiry1 = create(:item_expiry, expires: true, item: item)
    item_expiry2 = create(:item_expiry, expires: true, item: item)

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
    stock_item1 = create(:stock_item, expires: true)
    stock_item2 = create(:stock_item, expires: true)
    item1 = create(:item, stock_item: stock_item1, expires: true)
    item2 = create(:item, stock_item: stock_item2, expires: true)
    item_expiry1 = create(:item_expiry, item: item1, expires: true)
    item_expiry2 = create(:item_expiry, item: item1, expires: true)

    visit "/stock_items"

    expect(page).to have_text(stock_item1.item_code)
    expect(page).to have_text(stock_item1.name)
    expect(page).to have_text(stock_item1.expires ? "Yes": "No")
    expect(page).to have_text(item_expiry1.count + item_expiry2.count)
      
    expect(page).to have_text(stock_item2.item_code)
    expect(page).to have_text(stock_item2.name)
    expect(page).to have_text(stock_item2.expires ? "Yes": "No")
    expect(page).to have_text(0)
  end

  scenario "User checks a single stock item" do
    stock_item = create(:stock_item, expires: true)
    item1 = create(:item, stock_item: stock_item, expires: true)
    item2 = create(:item, stock_item: stock_item, expires: true)
    item_expiry1 = create(:item_expiry, item: item1, expires: true)
    item_expiry2 = create(:item_expiry, item: item1, expires: true)

    visit "/stock_items/#{stock_item.to_param}"
    
    expect(page).to have_text(stock_item.item_code)
    expect(page).to have_text(stock_item.name)
    expect(page).to have_text(stock_item.expires ? "Yes": "No")

    expect(page).to have_text(item1.location.name)
    expect(page).to have_text(item_expiry1.count + item_expiry2.count)
    expect(page).to have_text(item1.required)
    expect(page).to have_text(item1.order_to)

    expect(page).to have_text(item2.location.name)
    expect(page).to have_text(0)
    expect(page).to have_text(item2.required)
    expect(page).to have_text(item2.order_to)
  end
end

