require 'rails_helper'

RSpec.feature "Report", type: :feature do
  before(:each) do
    login_as(FactoryGirl.create(:report_user))
  end

  pending "Complete scenarios"

  scenario "Global summary report" do
  end

  scenario "Location report showing expires" do
  end

  scenario "Location report showing summaries" do
  end

  scenario "Location report with order to filtering" do
  end
end
