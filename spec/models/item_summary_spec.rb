require 'rails_helper'

RSpec.describe ItemSummary, type: :model do
  let(:item) { create(:item, required: 5, order_to: 10) }

  it "is ready only" do
    expect(item.item_summary.readonly?).to be true
  end

  it "summary required equal to required" do
    expect(item.item_summary.required).to eq(item.required)
  end
  it "summary order to equal to order to" do
    expect(item.item_summary.order_to).to eq(item.order_to)
  end
  it "summary location equal to location" do
    expect(item.item_summary.location).to eq(item.location)
  end
  it "summary stock item equal to stock item" do
    expect(item.item_summary.stock_item).to eq(item.stock_item)
  end

  describe "Total" do
    it "is 0 for new item" do
      expect(item.item_summary.total).to eq(0)
    end

    it "updates after adding expiry" do
      create(:item_expiry, item: item, count: 2)
      expect(item.item_summary.total).to eq(2)
    end

    it "updates after adding and removing expiry" do
      item_expiry = create(:item_expiry, item: item, count: 2)
      item_expiry.destroy
      expect(item.item_summary.total).to eq(0)
    end
  end

  describe "Order Amount" do
    it "is order to for new item" do
      expect(item.item_summary.order_amount).to eq(10)
    end

    it "updates after adding expiry" do
      create(:item_expiry, item: item, count: 2)
      expect(item.item_summary.order_amount).to eq(8)
    end

    it "goes to zero when total is more than required" do
      item_expiry = create(:item_expiry, item: item, count: 6)
      expect(item.item_summary.order_amount).to eq(0)
    end
  end
end
