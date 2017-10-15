require 'rails_helper'
require 'support/devise'

RSpec.describe StockItemsController, type: :controller do
  login_admin

  let!(:stock_item) {create(:stock_item)}

  describe "GET #index" do
    before(:each) do
      get :index, params: {}
    end

    it "returns a success response" do
      expect(response).to be_success
    end

    it "renders index template" do
      expect(response).to render_template("index")
    end

    it "assigns @stock_items" do
      expect(assigns(:stock_items)).to eq([stock_item])
    end
  end

  describe "GET #show" do
    before(:each) do
      get :show, params: {id: stock_item.to_param}
    end

    it "returns a success response" do
      expect(response).to be_success
    end

    it "renders show template" do
      expect(response).to render_template("show")
    end

    it "assigns @stock_item" do
      expect(assigns(:stock_item)).to eq(stock_item)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_success
    end

    it "renders new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    before(:each) do
      get :edit, params: {id: stock_item.to_param}
    end

    it "returns a success response" do
      expect(response).to be_success
    end

    it "renders edit template" do
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new stock item" do
        expect {
          post :create, params: {stock_item: {name: "Stock Item", item_code: "5", expires: false}}
        }.to change(StockItem, :count).by(1)
      end

      it "redirects to the created stock_item" do
        post :create, params: {stock_item: {name: "Stock Item", item_code: "5", expires: false}}
        expect(response).to redirect_to(StockItem.last)
      end
    end

    context "with invalid params" do
      it "renders new template" do
        post :create, params: {stock_item: {name: nil}}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested stock item" do
        put :update, params: {id: stock_item.to_param, stock_item: {name: "New Name"}}
        stock_item.reload
        expect(stock_item.name).to eq "New Name"
      end

      it "redirects to the stock item" do
        put :update, params: {id: stock_item.to_param, stock_item: {name: stock_item.name}}
        expect(response).to redirect_to(stock_item)
      end
    end

    context "with invalid params" do
      it "renders edit template" do
        put :update, params: {id: stock_item.to_param, stock_item: {name: nil}}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested location" do
      stock_item = create(:stock_item)
      expect {
        delete :destroy, params: {id: stock_item.to_param}
      }.to change(StockItem, :count).by(-1)
    end

    it "redirects to the stock item index" do
      delete :destroy, params: {id: stock_item.to_param}
      expect(response).to redirect_to(stock_items_url)
    end
  end

end
