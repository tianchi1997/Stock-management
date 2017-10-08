require 'rails_helper'

RSpec.describe "stock_items/new", type: :view do
  before(:each) do
    assign(:stock_item, StockItem.new(
      name: "MyString",
      description: "MyString",
      supplier: "MyString",
      expires: false
    ))
  end

  it "renders new stock_item form" do
    render

    assert_select "form[action=?][method=?]", stock_items_path, "post" do

      assert_select "input[name=?]", "stock_item[name]"

      assert_select "input[name=?]", "stock_item[description]"

      assert_select "input[name=?]", "stock_item[supplier]"

      assert_select "input[name=?]", "stock_item[expires]"
    end
  end
end
