require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :location => nil,
      :stock_item => nil,
      :required => 1,
      :order_to => 1
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[location_id]"

      assert_select "input[name=?]", "item[stock_item_id]"

      assert_select "input[name=?]", "item[required]"

      assert_select "input[name=?]", "item[order_to]"
    end
  end
end
