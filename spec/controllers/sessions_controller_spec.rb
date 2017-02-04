require 'rails_helper'

xdescribe SessionsController do

  let! (:user) { create(:user) }
  # let (:credentials) { { session: {} } }
  # let (:bad_credentials) { { session: { } }

  describe 'sessions#create' do

    it "creates a user session with proper credentials" do
      post :create, params: credentials
      expect(current_user).to eq user.id
    end

    it "does not create a user session with improper credentials" do
      post :create, params: bad_credentials
      expect(current_user).to be_nil
    end

    it "renders a new template if improper credentials are given" do
      post :create, params: bad_credentials
      expect(response).to render_template('new')
    end

    it "redirects users who are not the commissioner to the index for customers" do
      post :create, params: credentials
      expect(response).to redirect_to ''
    end

    it "redirects users who are the commissioner to the index for the commissioner" do
      post :create, params: admin_credentials
      expect(response).to redirect_to ''
    end
  end

  describe "#destroy" do
    context "when user logged in" do
      before :each do
        post :create, params: credentials
      end

      it "destroys user session" do
        get :destroy
        expect(current_user).to be_nil
      end

      it "redirects to home page" do
        get :destroy
        expect(response).to redirect_to '/'
      end
    end
  end

  describe "#new" do

    it 'responds with status code 200' do
      get :new
      expect(response).to have_http_status 200
    end

    it 'assigns the user as @user' do
      get :new
      expect(assigns(:user)).to be_a_new User
    end

    it 'renders the : template' do
      get :new
      expect(response).to render_template('')
    end
  end
end
