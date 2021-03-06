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

    it "ancestry is read only" do
      is_expected.to have_readonly_attribute(:ancestry)
    end
  end

  describe "Validations" do
    it "validates presence of name" do
      is_expected.to validate_presence_of(:name)
    end
  end

  it "parent name is no parent for root location" do
    expect(build(:location).parent_name).to eq "No Parent"
  end

  it "parent name is parents name for non root location" do
    parent = create(:location)
    expect(create(:location, parent: parent).parent_name).to eq parent.name
  end
end
