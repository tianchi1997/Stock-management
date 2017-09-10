require 'rails_helper'

RSpec.describe Group, type: :model do
  it "is valid with a name" do
    expect(Group.new(name: "Hospital")).to be_valid
  end

  it "is invalid without a name" do
    expect(Group.new()).to be_invalid
  end
end
