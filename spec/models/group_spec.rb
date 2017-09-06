require 'rails_helper'

RSpec.describe Group, type: :model do
  context "is valid with a name" do
    group1 = Group.new(name: "Hospital")
    group2 = Group.new(name: "Bag", group: group1)

    it "without parent" do
        expect(group1).to be_valid
    end

    it "with parent" do
        expect(group2).to be_valid
    end
  end

  context "is invalid without a name" do
    group1 = Group.new()
    group2 = Group.new(group: group1)

    it "without parent" do
        expect(group1).to_not be_valid
    end

    it "with parent" do
        expect(group2).to_not be_valid
    end
  end
end
