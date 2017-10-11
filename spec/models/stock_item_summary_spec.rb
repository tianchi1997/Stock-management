require 'rails_helper'

RSpec.describe StockItemSummary, type: :model do
  let(:stock_item) { create(:stock_item, expires: true) }

  it "is read only" do
    expect(stock_item.stock_item_summary.readonly?).to be true
  end

  describe "Stock Item Summaries with no Location" do
    it "location is nil" do
      expect(stock_item.stock_item_summary.location).to be nil
    end

    describe "No Items" do
      it "total is 0" do
        expect(stock_item.stock_item_summary.total).to eq 0
      end

      it "required is 0" do
        expect(stock_item.stock_item_summary.required).to eq 0
      end

      it "order to is 0" do
        expect(stock_item.stock_item_summary.order_to).to eq 0
      end

      it "order amount is 0" do
        expect(stock_item.stock_item_summary.order_amount).to eq 0
      end
    end

    describe "One Item" do
      before(:each) do
        item = create(:item, stock_item: stock_item, required: 5)
      end

      it "total is 0" do
        expect(stock_item.stock_item_summary.total).to eq 0
      end

      it "required is 5" do
        expect(stock_item.stock_item_summary.required).to eq 5
      end

      it "order to is 5" do
        expect(stock_item.stock_item_summary.order_to).to eq 5
      end

      it "order amount is 5" do
        expect(stock_item.stock_item_summary.order_amount).to eq 5
      end
    end

    describe "Two Items" do
      let!(:item1) {create(:item, stock_item: stock_item, required: 5)}
      let!(:item2) {create(:item, stock_item: stock_item, required: 5, order_to: 10)}

      it "total is 0" do
        expect(stock_item.stock_item_summary.total).to eq 0
      end

      it "required is 5" do
        expect(stock_item.stock_item_summary.required).to eq 10
      end

      it "order to is 5" do
        expect(stock_item.stock_item_summary.order_to).to eq 15
      end

      it "order amount is 5" do
        expect(stock_item.stock_item_summary.order_amount).to eq 15
      end

      describe "Adding expiries" do
        let!(:expiry1) {create(:item_expiry, item: item1, count: 5, expires: true)}
        let!(:expiry2) {create(:item_expiry, item: item2, count: 5, expires: true)}

        it "total updates when expiries added to items" do
          expect(stock_item.stock_item_summary.total).to eq 10
        end
          
        it "order amount updates when expiries added to items" do
          expect(stock_item.stock_item_summary.order_amount).to eq 0
        end

        it "total updates when expiries deleted" do
          expiry1.destroy
          expect(stock_item.stock_item_summary.total).to eq 5
        end

        it "total updates when item deleted" do
          item1.destroy
          expect(stock_item.stock_item_summary.total).to be 5
        end
      end
    end
  end

  describe "Stock Item Summaries with Location" do
    let(:location) {create(:location)}
    let(:stock_item_summary) {stock_item.stock_item_summaries.find_by(location: location)}

    it "should not exist if no items" do
      expect(stock_item_summary).to be nil
    end

    describe "One Item" do
      before(:each) do
        item = create(:item, stock_item: stock_item, required: 5, location: location)
      end

      it "total is 0" do
        expect(stock_item_summary.total).to eq 0
      end

      it "required is 5" do
        expect(stock_item_summary.required).to eq 5
      end

      it "order to is 5" do
        expect(stock_item_summary.order_to).to eq 5
      end

      it "order amount is 5" do
        expect(stock_item_summary.order_amount).to eq 5
      end
    end

    describe "Two Items" do
      let!(:item1) {create(:item, stock_item: stock_item, required: 5, location: location)}
      let!(:item2) {create(:item, stock_item: stock_item, required: 5, order_to: 10)}

      it "total is 0" do
        expect(stock_item_summary.total).to eq 0
      end

      it "required is 5" do
        expect(stock_item_summary.required).to eq 5
      end

      it "order to is 5" do
        expect(stock_item_summary.order_to).to eq 5
      end

      it "order amount is 5" do
        expect(stock_item_summary.order_amount).to eq 5
      end

      describe "Adding expiries" do
        let!(:expiry1) {create(:item_expiry, item: item1, count: 4, expires: true)}
        let!(:expiry2) {create(:item_expiry, item: item2, count: 5, expires: true)}

        it "total updates when expiries added to items" do
          expect(stock_item_summary.total).to eq 4
        end
          
        it "order amount updates when expiries added to items" do
          expect(stock_item_summary.order_amount).to eq 1
        end

        it "total updates when expiries deleted" do
          expiry1.destroy
          expect(stock_item_summary.total).to eq 0
        end

        it "stock item summary is nil when item deleted" do
          item1.destroy
          expect(stock_item_summary).to be nil
        end
      end
    end
  end
end
