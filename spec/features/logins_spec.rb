require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  let(:user) {FactoryGirl.create(:user, password: "password")}

  scenario "User logs in from main page" do
    visit "/"
    expect(page).to have_current_path("/users/sign_in")

    within "#new_user" do
      fill_in("Email", with: user.email)
      fill_in("Password", with: "password")
    end

    click_button "Log in"
    expect(page).to have_current_path("/")
  end

  scenario "User logs in requesting locations page" do
    visit "/locations"
    expect(page).to have_current_path("/users/sign_in")

    within "#new_user" do
      fill_in("Email", with: user.email)
      fill_in("Password", with: "password")
    end

    click_button "Log in"
    expect(page).to have_current_path("/locations")
  end
end
