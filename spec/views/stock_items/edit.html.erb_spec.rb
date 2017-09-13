require 'rails_helper'

RSpec.describe "stock_items/edit", type: :view do
  before(:each) do
    @stock_item = assign(:stock_item, StockItem.create!(
      :name => "MyString",
      :description => "MyString",
      :supplier => "MyString",
      :expires => false
    ))
  end

  it "renders the edit stock_item form" do
    render

    assert_select "form[action=?][method=?]", stock_item_path(@stock_item), "post" do

      assert_select "input[name=?]", "stock_item[name]"

      assert_select "input[name=?]", "stock_item[description]"

      assert_select "input[name=?]", "stock_item[supplier]"

      assert_select "input[name=?]", "stock_item[expires]"
    end
  end
end
