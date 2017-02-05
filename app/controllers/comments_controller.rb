class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_pin, only: [:new, :create, :edit, :update, :destroy]



  def show
  end

  def new
    if current_user
      @comment = Comment.new
    else
      redirect_to root_path, notice: 'You have to be logged it to do that!!'
    end
  end

  def edit
    if current_user
    else
      redirect_to root_path, notice: 'You have to be logged it to do that!!'
    end
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to pin_path(@pin), notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to pin_path(@pin), notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    if current_user
      @comment.destroy
      redirect_to pin_path(@pin), notice: 'Comment was successfully destroyed.'
    else
      redirect_to root_path, notice: 'You have to be logged it to do that!!'
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_pin
      @pin = Pin.find(params[:pin_id])
    end

    def comment_params
      params.require(:comment).permit(:user_id, :content, :pin_id)
    end
end
