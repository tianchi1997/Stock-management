require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "Validations" do
    it "validates presence of required" do
      is_expected.to validate_presence_of(:required)
    end

    pending "validates children"
  end

  describe "Associations" do
    it "belongs to location" do
      is_expected.to belong_to(:location)
    end

    it "belongs to stock item" do
      is_expected.to belong_to(:stock_item)
    end

    it "has many item expiries and destroys dependents" do
      is_expected.to have_many(:item_expiries).dependent(:destroy)
    end
  end
end
