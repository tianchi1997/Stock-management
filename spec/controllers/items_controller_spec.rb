require 'rails_helper'
require 'support/devise'

RSpec.describe ItemsController, type: :controller do
  # Log in as admin, permissions are tested under ability model
  login_admin

  let!(:item) {create(:item, expires: true)}

  describe "GET #show" do
    before(:each) do
      get :show, params: {id: item.to_param}
    end

    it "returns a success response" do
      expect(response).to be_success
    end

    it "renders show template" do
      expect(response).to render_template("show")
    end

    it "assigns @item and @audits" do
      expect(assigns(:item)).to eq(item)
      expect(assigns(:audits)).to eq(item.associated_audits)
    end
  end

  describe "GET #new" do
    let(:location) { create(:location) }
    before(:each) do
      get :new, params: {location_id: location.to_param}
    end

    it "returns a success response" do
      expect(response).to be_success
    end

    it "renders new template" do
      expect(response).to render_template("new")
    end

    it "assigns @stock_items" do
      expect(assigns(:stock_items)).to eq([item.stock_item])
    end

    it "sets location of @item" do
      expect(assigns(:item).location).to eq(location)
    end
  end

  describe "GET #edit" do
    before(:each) do
      get :edit, params: {id: item.to_param}
    end

    it "returns a success response" do
      expect(response).to be_success
    end

    it "renders edit template" do
      expect(response).to render_template("edit")
    end

    it "assigns @item" do
      expect(assigns(:item)).to eq(item)
    end

    it "assigns @stock_items" do
      expect(assigns(:stock_items)).to eq([item.stock_item])
    end
  end

  describe "POST #create" do
    let(:stock_item) {create(:stock_item)}
    let(:location) {create(:location)}

    context "with valid params" do
      it "creates a new item" do
        expect {
          post :create, params: {item: {stock_item_id: stock_item.id, location_id: location.id, required: 5}}
        }.to change(Item, :count).by(1)
      end

      it "redirects to the created item" do
        post :create, params: {item: {stock_item_id: stock_item.id, location_id: location.id, required: 5}}
        expect(response).to redirect_to(Item.last)
      end
    end

    context "with invalid params" do
      it "renders new template" do
        post :create, params: {item: {stock_item_id: stock_item.id, location_id: location.id, required: -1}}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested item" do
        put :update, params: {id: item.to_param, item: {required: 100}}
        item.reload
        expect(item.required).to eq 100
      end

      it "redirects to the item" do
        put :update, params: {id: item.to_param, item: {required: 100}}
        expect(response).to redirect_to(item)
      end
    end

    context "with invalid params" do
      it "renders edit template" do
        put :update, params: {id: item.to_param, item: {required: -1}}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested item" do
      expect {
        delete :destroy, params: {id: item.to_param}
      }.to change(Item, :count).by(-1)
    end

    it "redirects to the items location" do
      delete :destroy, params: {id: item.to_param}
      expect(response).to redirect_to(location_path(item.location))
    end
  end

  describe "POST #save_expiries" do
    it "saves item expiries" do
      expect {
        post(
          :save_expiries, 
          body: [{
            itemId: item.to_param, 
            count: 5, 
            expiryDate: (DateTime.now. + 1.day).strftime("%F")
          }].to_json, 
          params: {id: item.to_param}, 
          format: :json
        )
      }.to change(ItemExpiry, :count).by(1)
    end

    it "audits if date alrady exists" do
      expiry = create(:item_expiry, item: item, expires: true)
      
      post(
       :save_expiries, 
        body: [{
          itemId: item.to_param, 
          count: 5,
          expiryDate: expiry.expiry_date.strftime("%F")
        }].to_json, 
        params: {id: item.to_param}, 
        format: :json
      )

      expect(item.associated_audits.count).to eq(2)
    end

    it "audits if date doesn't exist" do
      expiry = create(:item_expiry, item: item, expires: true)
      
      post(
       :save_expiries, 
        body: [{
          itemId: item.to_param, 
          count: 5,
          expiryDate: (DateTime.now + 5.days).strftime("%F")
        }].to_json, 
        params: {id: item.to_param}, 
        format: :json
      )

      expect(item.associated_audits.count).to eq(3)
    end
  end
end
