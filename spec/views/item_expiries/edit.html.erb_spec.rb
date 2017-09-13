require 'rails_helper'

RSpec.describe "item_expiries/edit", type: :view do
  before(:each) do
    @item_expiry = assign(:item_expiry, ItemExpiry.create!(
      :item => nil,
      :count => 1
    ))
  end

  it "renders the edit item_expiry form" do
    render

    assert_select "form[action=?][method=?]", item_expiry_path(@item_expiry), "post" do

      assert_select "input[name=?]", "item_expiry[item_id]"

      assert_select "input[name=?]", "item_expiry[count]"
    end
  end
end
