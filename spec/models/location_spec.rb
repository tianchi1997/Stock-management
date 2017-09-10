require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "Validations" do
    it "validates presence of name" do
      is_expected.to validate_presence_of(:name)
    end
  end

  describe "Assocations" do
    it "belongs to group" do
      is_expected.to belong_to(:group)
    end

    it "belongs to location" do
      is_expected.to belong_to(:location)
    end

    it "has many locations and destroys dependents" do
      is_expected.to have_many(:locations).dependent(:destroy)
    end

    it "has many items and destroys dependents" do
      is_expected.to have_many(:items).dependent(:destroy)
    end
  end
end
