class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_filter :check_for_cancel, :only => [:create, :update]

  def index
    @q = Pin.ransack(params[:q])
    @pins = @q.result(distinct: @true)
    @pintag = Pintag.new
    @pin = Pin.new
  end

  def about
  end

  def show
  end

  def new
    if current_user
      @pin = Pin.new
      @pin.lat = params[:latitude]
      @pin.lng = params[:longitude]
      respond_to do |format|
        format.html { render 'new' }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'You have to be logged it to do that!!' }
        format.js { redirect_to root_path, notice: 'You have to be logged it to do that!!' }
      end
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
          # format.html { redirect_to pins_path, notice: 'Gem was successfully created.' }
          format.js { render 'pintags/_form'}
        else
          format.html { redirect_to root_path, notice: 'Gem was not able to be created.'}
        end
      end
    else
      redirect_to root_path, notice: 'You have to be logged it to do that!!'
    end
  end

  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.js { render 'comments/_form'}
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
      params.require(:pin).permit(:user_id, :name, :appeal, :photo_url, :website, :lat, :lng, :image)
    end

    def check_for_cancel
      if params[:commit] == "Cancel"
        redirect_to root_path
      end
    end
end
