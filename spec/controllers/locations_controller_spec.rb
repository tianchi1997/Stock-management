require 'rails_helper'
require 'support/devise'

RSpec.describe LocationsController, type: :controller do
  # Log in as admin, permissions are tested under ability model
  login_admin

  describe "GET #index" do
    before(:each) do
      get :index
    end

    it "returns a success response" do
      expect(response).to be_success
    end

    it "renders index template" do
      expect(response).to render_template("index")
    end

    it "assigns @locations and @locations_tree" do
      location = create(:location)
      expect(assigns(:locations)).to eq([location])
      expect(assigns(:locations_tree)).to eq(location.descendants.arrange(order: [:position, :name, :id]))
    end
  end

  describe "GET #show" do
    let(:location) { create(:location) }
    before(:each) do
      get :show, params: {id: location.to_param}
    end

    it "returns a success response" do
      expect(response).to be_success
    end

    it "renders show template" do
      expect(response).to render_template("show")
    end

    it "assigns @location and @locations_tree" do
      expect(assigns(:location)).to eq(location)
      expect(assigns(:locations_tree)).to eq(location.descendants.arrange(order: [:position, :name, :id]))
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

    it "can take parent id as input" do
      parent = create(:location)
      get :new, params: {parent_id: parent.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    let(:location) { create(:location) }
    before(:each) do
      get :edit, params: {id: location.to_param}
    end

    it "returns a success response" do
      expect(response).to be_success
    end

    it "renders edit template" do
      expect(response).to render_template("edit")
    end

    it "assigns @location" do
      expect(assigns(:location)).to eq(location)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Location" do
        expect {
          post :create, params: {location: {name: "Location"}}
        }.to change(Location, :count).by(1)
      end

      it "redirects to the created location" do
        post :create, params: {location: {name: "Location"}}
        expect(response).to redirect_to(Location.last)
      end
    end

    context "with invalid params" do
      it "renders new template" do
        post :create, params: {location: {name: nil}}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested location" do
        location = create(:location)
        put :update, params: {id: location.to_param, location: {name: "New Name"}}
        location.reload
        expect(location.name).to eq "New Name"
      end

      it "redirects to the location" do
        location = create(:location)
        put :update, params: {id: location.to_param, location: {name: location.name}}
        expect(response).to redirect_to(location)
      end
    end

    context "with invalid params" do
      it "renders edit template" do
        location = create(:location)
        put :update, params: {id: location.to_param, location: {name: nil}}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested location" do
      location = create(:location)
      expect {
        delete :destroy, params: {id: location.to_param}
      }.to change(Location, :count).by(-1)
    end

    it "redirects to the locations list if root" do
      location = create(:location)
      delete :destroy, params: {id: location.to_param}
      expect(response).to redirect_to(locations_url)
    end

    it "redirects to parent list if not root" do
      parent = create(:location)
      location = create(:location, parent: parent)
      delete :destroy, params: {id: location.to_param}
      expect(response).to redirect_to(parent)
    end
  end
end
