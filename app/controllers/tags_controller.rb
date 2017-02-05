#shouldn't this be the PinTagController

class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

end
