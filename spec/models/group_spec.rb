require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "Assocations" do
    it "belongs to group" do
      is_expected.to belong_to(:group)
    end

    it "has many groups and destroys dependents" do
      is_expected.to have_many(:groups).dependent(:destroy)
    end

    it "has many locations and destroys dependents" do
      is_expected.to have_many(:locations).dependent(:destroy)
    end

    it "group ID is read only" do
      is_expected.to have_readonly_attribute(:group_id)
    end
  end

  describe "Validations" do
    it "validates presence of name" do
      is_expected.to validate_presence_of(:name)
    end
  end
end
