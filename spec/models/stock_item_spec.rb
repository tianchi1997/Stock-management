require 'rails_helper'

RSpec.describe StockItem, type: :model do
  describe "Associations" do
    it "has many items and destroys dependents" do
      is_expected.to have_many(:items).dependent(:destroy)
    end

    it "has many item expiries through items" do
      is_expected.to have_many(:item_expiries)
    end

    it "has many locations through items" do
      is_expected.to have_many(:locations)
    end
  end

  describe "Validations" do
    it "validates presence of item code" do
      is_expected.to validate_presence_of :item_code
    end

    it "validates presence of name" do
      is_expected.to validate_presence_of :name
    end
  end
end
