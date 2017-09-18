require 'rails_helper'

RSpec.describe "locations/new", type: :view do
  before(:each) do
    assign(:location, Location.new(
      :location => nil,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input[name=?]", "location[location_id]"

      assert_select "input[name=?]", "location[name]"

      assert_select "input[name=?]", "location[description]"
    end
  end
end
