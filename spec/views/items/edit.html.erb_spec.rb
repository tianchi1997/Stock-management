require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      location: nil,
      :stock_item => nil,
      required: 1,
      :order_to => 1
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input[name=?]", "item[location_id]"

      assert_select "input[name=?]", "item[stock_item_id]"

      assert_select "input[name=?]", "item[required]"

      assert_select "input[name=?]", "item[order_to]"
    end
  end
end
