require 'rails_helper'

RSpec.feature "StockCheck", type: :feature do
  let(:location) {FactoryGirl.create(:location)}

  before(:each) do
    login_as(FactoryGirl.create(:user), scope: :user)
  end

  scenario "User checks items at a location" do

  end

  scenario "User checks expiry dates for an item" do

  end

  scenario "User checks all stock items" do
      
  end

  scenario "User checks a single stock item" do
    
  end
end

