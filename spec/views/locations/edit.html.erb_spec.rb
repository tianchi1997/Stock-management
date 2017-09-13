require 'rails_helper'

RSpec.describe "locations/edit", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :group => nil,
      :location => nil,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", location_path(@location), "post" do

      assert_select "input[name=?]", "location[group_id]"

      assert_select "input[name=?]", "location[location_id]"

      assert_select "input[name=?]", "location[name]"

      assert_select "input[name=?]", "location[description]"
    end
  end
end
