require 'rails_helper'

RSpec.feature "Report", type: :feature ,js: true do
  before(:each) do
    login_as(FactoryGirl.create(:admin))
    
  end
  let(:stock_item1){FactoryGirl.create(:stock_item, expires: false)}
  let(:stock_item2){FactoryGirl.create(:stock_item, expires: true)}

  let!(:parent) {FactoryGirl.create(:location)}
  let!(:location) {FactoryGirl.create(:location, parent: parent)}
  let!(:item3) {FactoryGirl.create(:item, location: location, required: 5, stock_item: stock_item1, order_to: 10)}
  let!(:location2) {FactoryGirl.create(:location, parent: location)}
  let!(:item1) {FactoryGirl.create(:item, location: location2, stock_item: stock_item1,required: 5, order_to: 10)}
  let!(:item2) {FactoryGirl.create(:item, location: location2, stock_item: stock_item2, required: 5, order_to: 10, expires: true)}
  let!(:itemExpiry1) {FactoryGirl.create(:item_expiry, item: item2, expires: true)}
  let!(:itemExpiry2) {FactoryGirl.create(:item_expiry, item: item2, expires: true)}
  let!(:itemExpiry3) {
    itemExpiry3 = FactoryGirl.build(:item_expiry, item: item2 , expiry_date: Date.today - 5.days)
    itemExpiry3.save(validate: false)
  }
  

  scenario "Global summary report" do
    visit "/locations"
    expect(page).to have_text("New Location")

    click_button("View")

    expect(page).to have_text("Summary for All Locations")
    expect(page).to have_text(item1.stock_item.name)
    expect(page).to have_text(item2.stock_item.name)

    expect(page).to have_text(item1.required + item3.required)
    expect(page).to have_text(item2.required)
    expect(page).to have_text(item1.order_to + item3.order_to)
    expect(page).to have_text(item2.order_to)
  end

  scenario "Location report showing expires" do
    visit"/locations/#{parent.to_param}"


    find(:css, "#expiries[value='1']").set(true)
    find(:css, "#display_tree[value='1']").set(true)
    click_button("View")

    expect(page).to have_text(parent.name)
    expect(page).to have_text(location.name)
    expect(page).to have_text(location2.name)
    expect(page).to have_text(item1.stock_item.name)
    expect(page).to have_text(item2.stock_item.name)

    expect(page).to have_text(item1.required)
    expect(page).to have_text(item2.required)
    expect(page).to have_text(item1.order_to)
    expect(page).to have_text(item2.order_to)

    expect(page).to have_text(itemExpiry1.expiry_date)
    expect(page).to have_text(itemExpiry2.expiry_date)
    expect(page).to have_text(itemExpiry3.expiry_date)

  end

  scenario "Location report showing summary" do
    visit "/locations/#{parent.to_param}"
    

    click_button("View")

    expect(page).to have_text("Summary for "+parent.name)
    expect(page).to have_text(item1.stock_item.name)
    expect(page).to have_text(item2.stock_item.name)

    expect(page).to have_text(item1.required + item3.required)
    expect(page).to have_text(item2.required)
    expect(page).to have_text(item1.order_to + item3.order_to)
    expect(page).to have_text(item2.order_to)
  end

  scenario "Location report with order to filtering" do
    visit "/locations/#{parent.to_param}"
    
    find(:css, "#order_to[value='1']").set(true)
    click_button("View")

    expect(page).to have_text("Summary for "+parent.name)
    expect(page).to have_text(item1.stock_item.name)
    expect(page).to have_text(item2.stock_item.name)

    expect(page).to have_text(item1.required + item3.required)
    expect(page).to have_text(item2.required)
    expect(page).to have_text(item1.order_to + item3.order_to)
    expect(page).to have_text(item2.order_to)

    expect(page).to have_text("Amount to Order")
    expect(page).to have_text(item1.item_summary.order_amount+item3.item_summary.order_amount)
    expect(page).to have_text(item2.item_summary.order_amount)
  end
end
