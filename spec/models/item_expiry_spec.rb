require 'rails_helper'

RSpec.describe ItemExpiry, type: :model do
  describe "Associations" do
    it "belongs to item" do
      is_expected.to belong_to(:item)
    end

    it "has one stock item through item" do
      is_expected.to have_one(:stock_item)
    end

    it "item ID is read only" do
      is_expected.to have_readonly_attribute(:item_id)
    end
  end

  describe "Validations" do
    describe "Expiry Date" do
      it "valid with expiry date in future" do
        expect(build :item_expiry, expires: true).to be_valid
      end

      it "invalid with expiry date in past" do
        expect(build :item_expiry, expires: true,
               expiry_date: 1.day.ago).to be_invalid
      end
    end

    describe "Expiry Date matches Expiry" do
      let(:stock_item_with_expires) { build(:stock_item, expires: true) }
      let(:stock_item_without_expires) { build(:stock_item, expires: false) }

      it "valid with expiry date and expiry" do
        expect(build :item_expiry, expires: true,
               stock_item: stock_item_with_expires).to be_valid
      end

      it "valid with no expiry date and no expiry" do
        expect(build :item_expiry, expires: false,
               stock_item: stock_item_without_expires).to be_valid
      end

      it "invalid with no expiry date and expiry" do
        expect(build :item_expiry, expires: false,
               stock_item: stock_item_with_expires).to be_invalid
      end

      it "invalid with expiry date and no expiry" do
        expect(build :item_expiry, expires: true,
               stock_item: stock_item_without_expires).to be_invalid
      end
    end
  end
end
