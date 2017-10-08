require 'rails_helper'

RSpec.describe "locations/index", type: :view do
  before(:each) do
    assign(:locations, [
      Location.create!(
        location: nil,
        name: "Name",
        description: "Description"
      ),
      Location.create!(
        location: nil,
        name: "Name",
        description: "Description"
      )
    ])
  end

  it "renders a list of locations" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
  end
end
