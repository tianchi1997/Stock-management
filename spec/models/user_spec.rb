require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "validates name" do
      is_expected.to validate_presence_of :name
    end

    it "validates permission level" do
      is_expected.to validate_presence_of :permission_level
    end
  end

  describe "Helpers" do
    it "has permission for admin" do
      expect(build(:admin).permission_level_string).to eq("Admin")
    end

    it "has permission for report user" do
      expect(build(:report_user).permission_level_string).to eq("Report User")
    end
      
    it "has permission for user" do
      expect(build(:user).permission_level_string).to eq("User")
    end
  end
end
