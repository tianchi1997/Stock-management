require 'rails_helper'

RSpec.describe "groups/new", type: :view do
  before(:each) do
    assign(:group, Group.new(
      :group => nil,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new group form" do
    render

    assert_select "form[action=?][method=?]", groups_path, "post" do

      assert_select "input[name=?]", "group[group_id]"

      assert_select "input[name=?]", "group[name]"

      assert_select "input[name=?]", "group[description]"
    end
  end
end
