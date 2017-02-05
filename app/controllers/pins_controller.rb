class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all
  end

  def show
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
          format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
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
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.' }
    end
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:user_id, :appeal, :photo_url, :website)
    end
end
