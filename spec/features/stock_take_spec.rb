require 'rails_helper'
require 'support/wait_for_ajax'

RSpec.feature "StockTake", type: :feature, js: true do
  before(:each) do
    login_as(FactoryGirl.create(:user))
  end

  let!(:parent) {FactoryGirl.create(:location)}
  let!(:location1) {FactoryGirl.create(:location, parent: parent)}
  let!(:location2) {FactoryGirl.create(:location, parent: parent)}
  let!(:item1) {FactoryGirl.create(:item, location: location1, required: 5)}
  let!(:item2) {FactoryGirl.create(:item, location: location2, required: 5, order_to: 10, expires: true)}

  scenario "Stock Take with non-expiring items" do
    visit "/locations/#{location1.to_param}/stock_take"
    expect(page).to have_text(location1.name)
    expect(page).to have_text(location1.description)
    expect(page).to have_text(item1.stock_item.name)
    expect(page).to have_text(item1.required)
    expect(page).to have_text(item1.order_to)

    find("[name=quantity]").click
    click_button("C")
    click_button("9")
    click_button("Next")
    wait_for_ajax

    a = page.driver.browser.switch_to.alert
    expect(a.text).to eq("Stocktake completed")
    a.accept

    visit "/locations/#{location1.to_param}"
    expect(page).to have_text(item1.stock_item.name)
    expect(page).to have_text(item1.required)
    expect(page).to have_text(item1.order_to)
    expect(page).to have_text(9) # Total
  end

  scenario "Stock Take with expiring items" do
    visit "/locations/#{location2.to_param}/stock_take"
    expect(page).to have_text(location2.name)
    expect(page).to have_text(location2.description)
    expect(page).to have_text(item2.stock_item.name)
    expect(page).to have_text(item2.required)
    expect(page).to have_text(item2.order_to)

    find("[name=quantity]").click
    click_button("C")
    click_button("6")
    click_button("Next")

    # Invalid with quantity not equal to total
    a = page.driver.browser.switch_to.alert
    expect(a.text).to eq("Quantity does not match total")
    a.accept

    click_button("Add expiry")
    find("[name=count_0]").click
    click_button("C")
    click_button("6")
    fill_in("expiry_date_0", with: (DateTime.now + 2.weeks).strftime("%F"))
    click_button("Next")
    wait_for_ajax

    a = page.driver.browser.switch_to.alert
    expect(a.text).to eq("Stocktake completed")
    a.accept

    visit "/locations/#{location2.to_param}"
    expect(page).to have_text(item2.stock_item.name)
    expect(page).to have_text(item2.required)
    expect(page).to have_text(item2.order_to)
    expect(page).to have_text(6) # Total
  end

  scenario "Stock Take on multiple locations" do
    visit "/locations/#{parent.to_param}/stock_take"
    expect(page).to have_text(parent.name)
    expect(page).to have_text(location1.name)
    expect(page).to have_text(location1.description)
    expect(page).to have_text(item1.stock_item.name)
    expect(page).to have_text(item1.required)
    expect(page).to have_text(item1.order_to)

    find("[name=quantity]").click
    click_button("C")
    click_button("9")
    click_button("Next")
    wait_for_ajax

    expect(page).to have_text(parent.name)
    expect(page).to have_text(location2.name)
    expect(page).to have_text(location2.description)
    expect(page).to have_text(item2.stock_item.name)
    expect(page).to have_text(item2.required)
    expect(page).to have_text(item2.order_to)

    find("[name=quantity]").click
    click_button("C")
    click_button("6")
    click_button("Add expiry")
    find("[name=count_0]").click
    click_button("C")
    click_button("6")
    fill_in("expiry_date_0", with: (DateTime.now + 2.weeks).strftime("%F"))
    click_button("Next")
    wait_for_ajax

    a = page.driver.browser.switch_to.alert
    expect(a.text).to eq("Stocktake completed")
    a.accept

    visit "/locations/#{location1.to_param}"
    expect(page).to have_text(item1.stock_item.name)
    expect(page).to have_text(item1.required)
    expect(page).to have_text(item1.order_to)
    expect(page).to have_text(9) # Total

    visit "/locations/#{location2.to_param}"
    expect(page).to have_text(item2.stock_item.name)
    expect(page).to have_text(item2.required)
    expect(page).to have_text(item2.order_to)
    expect(page).to have_text(6) # Total
  end
end
