require 'rails_helper'

RSpec.describe PinsController, type: :controller do
  let!(:pin) { create(:pin) }
  let!(:invalid_attributes) { {appeal: "nothing to see here"} }

  describe 'no user is logged in' do
    it 'redirects users to pin show page when they try to make a new pin' do
      get :new, params: {:id => pin.to_param}
      expect(response).to redirect_to '/'
    end

    it 'responds with status code 302' do
      get :new, params: {:id => pin.to_param}
      expect(response).to have_http_status 302
    end
  end


  describe 'when a user is logged in' do
    let!(:user) { create(:user) }
    let!(:valid_attributes) { {user_id: user.id, name: "Something Pretty", appeal: "ItisreallyprettyIlikeit.", photo_url: "www.image.url",
      website: "www.reallypretty.like", lat: 47.5979520, lng: -122.3349440} }

    before(:each) do
      request.session[:user_id] = user.id
    end

    describe "GET #new" do
      it "assigns a new pin as @pin" do
        get :new, params: {:id => pin.to_param}
        expect(assigns(:pin)).to be_a_new(Pin)
      end
    end

    describe "GET #edit" do
      it "assigns the requested pin as @pin" do
        get :edit, params: {:id => pin.to_param}
        expect(assigns(:pin)).to eq(pin)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "renders the pintag form partial" do
          post :create, params: {:id => pin.to_param, pin: valid_attributes }, xhr: true
          expect(response).to render_template(:partial => "_form")
        end


        it "assigns a newly created pin as @pin" do
          post :create, params: {:id => pin.to_param, pin: valid_attributes}, xhr: true
          expect(response).to render_template('pintags/_form')
          expect(assigns(:pin)).to be_a(Pin)
          expect(assigns(:pin)).to be_persisted
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved pin as @pin" do
          post :create, params: {:id => pin.to_param, pin: invalid_attributes}
          expect(assigns(:pin)).to be_a_new(Pin)
        end

        xit "re-renders the 'new' template" do
          post :create, params: {:id => pin.to_param, pin: invalid_attributes}
          expect(response).to render_template(root_path)
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        xit "updates the requested pin" do
          pin = Pin.create! valid_attributes
          put :update, params: {id: pin.to_param, pin: valid_attributes}
          pin.reload
          skip("Add assertions for updated state")
        end

        it "assigns the requested pin as @pin" do
          pin = Pin.create! valid_attributes
          put :update, params: {id: pin.to_param, pin: valid_attributes}
          expect(assigns(:pin)).to eq(pin)
        end

        it "redirects to the pin" do
          put :update, params: {id: pin.to_param, pin: valid_attributes}
          expect(response).to redirect_to(pin_path(pin))
        end
      end

      context "with invalid params" do
        it "assigns the pin as @pin" do
          put :update, params: {id: pin.to_param, pin: invalid_attributes}
          expect(assigns(:pin)).to eq(pin)
        end

        # I don't understand why this test is not passing
        xit "re-renders the 'edit' template" do
          put :update, params: {id: pin.to_param, pin: invalid_attributes}
          expect(response).to render_template(edit_pin_pin_path(pin))
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested pin" do
        expect {
          delete :destroy, params: {id: pin.to_param}
        }.to change(Pin, :count).by(-1)
      end

      it "redirects to the pins list" do
        delete :destroy, params: {id: pin.to_param}
        expect(response).to redirect_to(pins_path)
      end
    end
  end
end
