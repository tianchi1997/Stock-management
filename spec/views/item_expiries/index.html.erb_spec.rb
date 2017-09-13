require 'rails_helper'

RSpec.describe "item_expiries/index", type: :view do
  before(:each) do
    assign(:item_expiries, [
      ItemExpiry.create!(
        :item => nil,
        :count => 2
      ),
      ItemExpiry.create!(
        :item => nil,
        :count => 2
      )
    ])
  end

  it "renders a list of item_expiries" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
