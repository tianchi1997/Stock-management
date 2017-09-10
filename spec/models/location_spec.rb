require 'rails_helper'

RSpec.describe Location, type: :model do
  context "with a group" do
    g = Group.new name: "Hospital"

    it "valid with name" do
      expect(g.locations.new name: "Building A").to be_valid
    end

    it "invalid without name" do
      expect(g.locations.new).to be_invalid
    end
  end

  context "without a group" do
    it "invalid with name" do
      expect(Location.new name: "Building A").to be_invalid
    end

    it "invalid without name" do
      expect(Location.new).to be_invalid
    end
  end
end
