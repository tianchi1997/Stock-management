require 'rails_helper'

RSpec.describe "stock_items/index", type: :view do
  before(:each) do
    assign(:stock_items, [
      StockItem.create!(
        name: "Name",
        description: "Description",
        supplier: "Supplier",
        expires: false
      ),
      StockItem.create!(
        name: "Name",
        description: "Description",
        supplier: "Supplier",
        expires: false
      )
    ])
  end

  it "renders a list of stock_items" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "Supplier".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
