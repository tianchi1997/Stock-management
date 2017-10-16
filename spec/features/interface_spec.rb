require 'rails_helper'

RSpec.feature "Interface", type: :feature do
  pending "add some scenarios (or delete) #{__FILE__}"
  before(:each) do
    login_as(FactoryGirl.create(:user))
  end
    let!(:locationroot) {FactoryGirl.create(:location)}
    let!(:location1) {FactoryGirl.create(:location, parent: locationroot)}
    let!(:location2) {FactoryGirl.create(:location, parent: location1)}
    let!(:item1) {FactoryGirl.create(:item, location: location2, required: 5)}
  scenario "numpad is present" do 
    visit "/locations/#{location1.to_param}/stock_take"
    within('div#numpad') do
      within('input#1') do
        expect(page).to have_content("1")
        end
      within('input#2') do
        expect(page).to have_content("2")
      end
      within('input#3') do
        expect(page).to have_content("3")  
      end
      within('input#4') do
        expect(page).to have_content("4")
      end
      within('input#5') do
        expect(page).to have_content("5")
      end
      within('input#6') do
        expect(page).to have_content("6")  
      end
      within('input#7') do
        expect(page).to have_content("7")  
      end
      within('input#8') do
        expect(page).to have_content("8")  
      end
      within('input#9') do
        expect(page).to have_content("9")  
      end
end
