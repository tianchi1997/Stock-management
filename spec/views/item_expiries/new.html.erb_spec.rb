require 'rails_helper'

RSpec.describe "item_expiries/new", type: :view do
  before(:each) do
    assign(:item_expiry, ItemExpiry.new(
      :item => nil,
      :count => 1
    ))
  end

  it "renders new item_expiry form" do
    render

    assert_select "form[action=?][method=?]", item_expiries_path, "post" do

      assert_select "input[name=?]", "item_expiry[item_id]"

      assert_select "input[name=?]", "item_expiry[count]"
    end
  end
end
