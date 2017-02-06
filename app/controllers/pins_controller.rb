class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  def index
    if @filter_tag
      @pin_tags = PinTag.where(tag_id: @filter_tag)
    else
      @pins = Pin.all
    end
  end

#this takes you to the filter/ "Go Exploring" view
  def explore
    @tags = Tag.all
  end

#the post action for the params for the explore view
  def filter
    @filter_tag = params['/explore'][:tag_id]
    redirect_to root_path
  end

  def show
    @pin_tags = PinTag.where(pin_id: @pin.id)
  end

  def new
    if current_user
      @pin = Pin.new
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
    if current_user
      @pin = Pin.new(pin_params)
      respond_to do |format|
        if @pin.save
          format.html { redirect_to @pin, notice: 'Gem was successfully created.' }
        else
          format.html { render :new }
        end
      end
    else
      redirect_to root_path, notice: 'You have to be logged it to do that!!'
    end
  end

  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Gem was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Gem was successfully destroyed.' }
    end
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:user_id, :appeal, :photo_url, :website, :lat, :lng)
    end
end
