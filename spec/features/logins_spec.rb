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

  scenario "Admin updates item and change is logged" do
    admin = FactoryGirl.create(:admin)
    item = FactoryGirl.create(:item)

    expect(item.audits.count).to eq(1)

    login_as(admin, scope: :user)
    visit "/items/#{item.id}"
    expect(page).to have_current_path("/items/#{item.id}")

    click_link "Edit"
    expect(page).to have_current_path("/items/#{item.id}/edit")

    within "#edit_item_#{item.id}" do
      fill_in("Required", with: "20")
    end

    click_button "Update Item"
    item.reload
    expect(item.required).to eq(20)
    
    expect(item.audits.count).to eq(2)
  end
end
