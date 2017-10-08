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
    subject { build(:item) }
    it "validates required is greater than 0" do
      is_expected.to validate_numericality_of(:required).is_greater_than(0)
    end

    it "validates order is greater than required" do
      is_expected.to validate_numericality_of(:order_to)
    end
  end
end
