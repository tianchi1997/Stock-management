require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  it "displays title" do
    render 
    expect(rendered).to contain('Stock Management System')
  context "admin permission" do
    it "displays all actions" do
      skip
  
  


end
