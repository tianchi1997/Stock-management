require 'rails_helper'

RSpec.describe Item, type: :model do
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

    it "location ID is readonly" do
      is_expected.to have_readonly_attribute(:location_id)
    end

    it "stock item ID is readonly" do
      is_expected.to have_readonly_attribute(:stock_item_id)
    end
  end

  describe "Validations" do
    it "validates presence of required" do
      is_expected.to validate_presence_of(:required)
    end
  end
end
