require 'rails_helper'

RSpec.describe "item_expiries/show", type: :view do
  before(:each) do
    @item_expiry = assign(:item_expiry, ItemExpiry.create!(
      :item => nil,
      :count => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
