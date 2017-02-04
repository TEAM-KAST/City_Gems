require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before(:each)do
    create(:comment)
    create(:pin)
    user = create(:user)
    request.session[:user_id] = user.id
  end

  describe "GET #show" do
    it "assigns the requested comment as @comment" do
      get :show, params: {id: comment.to_param}
      expect(assigns(:comment)).to eq(comment)
    end
  end

  describe "GET #new" do
    it "assigns a new comment as @comment" do
      get :new, params: {}, session: valid_session
      expect(assigns(:comment)).to be_a_new(Comment)
    end
  end

  describe "GET #edit" do
    it "assigns the requested comment as @comment" do
      get :edit, params: {id: comment.to_param}
      expect(assigns(:comment)).to eq(comment)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, params: {comment: valid_attributes}
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, params: {comment: valid_attributes}
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

      it "redirects to the created comment" do
        post :create, params: {comment: valid_attributes}
        expect(response).to redirect_to(Comment.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        post :create, params: {comment: invalid_attributes}
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        post :create, params: {comment: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested comment" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: new_attributes}
        comment.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested comment as @comment" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: valid_attributes}
        expect(assigns(:comment)).to eq(comment)
      end

      it "redirects to the comment" do
        put :update, params: {id: comment.to_param, comment: valid_attributes}
        expect(response).to redirect_to(comment)
      end
    end

    context "with invalid params" do
      it "assigns the comment as @comment" do
        put :update, params: {id: comment.to_param, comment: invalid_attributes}
        expect(assigns(:comment)).to eq(comment)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: comment.to_param, comment: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comment" do
      expect {
        delete :destroy, params: {id: comment.to_param}
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      delete :destroy, params: {id: comment.to_param}
      expect(response).to redirect_to(comments_url)
    end
  end

end
