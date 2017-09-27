require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "Assocations" do
    it "has many items and destroys dependents" do
      is_expected.to have_many(:items).dependent(:destroy)
    end

    it "has many stock items through items" do
      is_expected.to have_many(:stock_items)
    end

    it "has many item expiries through items" do
      is_expected.to have_many(:item_expiries)
    end

    it "location ID is read only" do
      is_expected.to have_readonly_attribute(:parent_id)
    end
  end

  describe "Validations" do
    it "validates presence of name" do
      is_expected.to validate_presence_of(:name)
    end
  end
end
