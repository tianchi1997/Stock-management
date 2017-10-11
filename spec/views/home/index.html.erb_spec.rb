require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  before(:each) do
    allow(controller).to receive_messages(current_user: user)
    allow(view).to receive_messages(current_user: user)
  end

  describe "User" do
    let(:user) { build(:user) }
    it "displays page" do
      render
      expect(rendered).to include('Stock Management System')
      expect(rendered).to include('Locations')
      expect(rendered).to include('Stock Items')
      expect(rendered).not_to include('Users')
    end
  end

  describe "Admin" do
    let(:user) { build(:admin) }
    it "displays page" do
      render
      expect(rendered).to include('Stock Management System')
      expect(rendered).to include('Locations')
      expect(rendered).to include('Stock Items')
      expect(rendered).to include('Users')
    end
  end
end
