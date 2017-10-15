require 'rails_helper'

RSpec.feature "StockCheck", type: :feature do
  let(:location) {FactoryGirl.create(:location)}

  before(:each) do
    login_as(FactoryGirl.create(:user), scope: :user)
  end


  scenario "User views items at a specific location" do
  end

  scenario "User views expiry dates for a specific item" do
  end
  
end

