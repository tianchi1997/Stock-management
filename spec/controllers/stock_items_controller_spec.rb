require 'rails_helper'
require 'support/devise'

RSpec.describe StockItemsController, type: :controller do
  login_admin
  # This should return the minimal set of attributes required to create a valid
  # StockItem. As you add validations to StockItem, be sure to
  # adjust the attributes here as well.
 # let(:valid_attributes) {
 #   :name "Item"
 #   :item_code "I"
 #   :expires false
 # }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StockItemsController. Be sure to keep this updated too.

  describe "GET #index" do
    it "returns a success response" do
      stock_item = StockItem.create! valid_attributes
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      stock_item = StockItem.create! valid_attributes
      get :show, params: {id: stock_item.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      stock_item = StockItem.create! valid_attributes
      get :edit, params: {id: stock_item.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new StockItem" do
        expect {
          post :create, params: {stock_item: valid_attributes}
        }.to change(StockItem, :count).by(1)
      end

      it "redirects to the created stock_item" do
        post :create, params: {stock_item: valid_attributes}
        expect(response).to redirect_to(StockItem.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {stock_item: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested stock_item" do
        stock_item = StockItem.create! valid_attributes
        put :update, params: {id: stock_item.to_param, stock_item: new_attributes}
        stock_item.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the stock_item" do
        stock_item = StockItem.create! valid_attributes
        put :update, params: {id: stock_item.to_param, stock_item: valid_attributes}
        expect(response).to redirect_to(stock_item)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        stock_item = StockItem.create! valid_attributes
        put :update, params: {id: stock_item.to_param, stock_item: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested stock_item" do
      stock_item = StockItem.create! valid_attributes
      expect {
        delete :destroy, params: {id: stock_item.to_param}
      }.to change(StockItem, :count).by(-1)
    end

    it "redirects to the stock_items list" do
      stock_item = StockItem.create! valid_attributes
      delete :destroy, params: {id: stock_item.to_param}
      expect(response).to redirect_to(stock_items_url)
    end
  end

end
