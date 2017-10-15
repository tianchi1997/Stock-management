require 'rails_helper'
require 'support/devise'

RSpec.describe UsersController, type: :controller do
  # Log in as admin, permissions are tested under ability model
  login_admin

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
  end

  describe "GET #show" do
    let(:user) { create(:user) }
    before(:each) do
      get :show, params: {id: user.to_param}
    end

    it "returns a success response" do
      expect(response).to be_success
    end

    it "renders show template" do
      expect(response).to render_template("show")
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
    let(:user) { create(:user) }
    before(:each) do
      get :edit, params: {id: user.to_param}
    end

    it "returns a success response" do
      expect(response).to be_success
    end

    it "renders edit template" do
      expect(response).to render_template("edit")
    end

    it "assigns @user correctly" do
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new user" do
        expect {
          post :create, params: {user: {email: "user@example.com", name: "User" , permission_level: 0, password: "password"}}
        }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        user = create(:user)
        post :create, params: {user: {email: "user@example.com", name: "User" , permission_level: 0, password: "password"}}
        expect(response).to redirect_to(User.last)
      end
    end

    context "with invalid params" do
      it "renders new template" do
        user = create(:user)
        post :create, params: {user: {name: nil}}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested user" do
        user = create(:user)
        put :update, params: {id: user.to_param, user: {name: "New Name"}}
        user.reload
        expect(user.name).to eq "New Name"
      end

      it "redirects to the User" do
        user = create(:user)
        put :update, params: {id: user.to_param, user: {name: user.name}}
        expect(response).to redirect_to(user)
      end
    end

    context "with invalid params" do
      it "renders edit template" do
        user = create(:user)
        put :update, params: {id: user.to_param, user: {email: "notanemail"}}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = create(:user)
      expect {
        delete :destroy, params: {id: user.to_param}
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list if root" do
      user = create(:user)
      delete :destroy, params: {id: user.to_param}
      expect(response).to redirect_to(users_url)
    end
  end
end
