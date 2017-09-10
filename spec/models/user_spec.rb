require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "validates permission level" do
      is_expected.to validate_presence_of :permission_level
    end
  end
end
