require 'rails_helper'

RSpec.describe "stock_items/show", type: :view do
  before(:each) do
    @stock_item = assign(:stock_item, StockItem.create!(
      :name => "Name",
      :description => "Description",
      :supplier => "Supplier",
      :expires => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Supplier/)
    expect(rendered).to match(/false/)
  end
end
