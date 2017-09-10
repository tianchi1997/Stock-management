require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "Assocations" do
    it "belongs to group" do
      is_expected.to belong_to(:group)
    end

    it "belongs to location" do
      is_expected.to belong_to(:location)
    end

    it "has many items and destroys dependents" do
      is_expected.to have_many(:items).dependent(:destroy)
    end

    it "has many locations and destroys dependents" do
      is_expected.to have_many(:locations).dependent(:destroy)
    end

    it "has many stock items through items" do
      is_expected.to have_many(:stock_items)
    end

    it "group ID is read only" do
      is_expected.to have_readonly_attribute(:group_id)
    end

    it "location ID is read only" do
      is_expected.to have_readonly_attribute(:location_id)
    end
  end

  describe "Validations" do
    it "validates presence of name" do
      is_expected.to validate_presence_of(:name)
    end
  end
end
