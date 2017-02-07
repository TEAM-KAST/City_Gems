class PintagsController < ApplicationController

  def new
    if current_user
      @pintag = Pintag.new
    else
      redirect_to @pin, notice: 'You have to be logged in to add tags'
    end
  end

  def create
    if current_user
      @pintag = Pintag.create(pintag_params)
    respond_to do |format|
        if @pintag.save
          format.html { redirect_to "/pins/#{@pintag.pin_id}", notice: 'tag added.' }
        else
          format.html { render :new }
        end
      end
    else
      redirect_to @pin, notice: 'You have to be logged it to tag this'
    end

  end

#   def update
#     respond_to do |format|
#       if @pintag.update(pintag_params)
#         format.html { redirect_to "/pins/#{@pintag.pin_id,  notice: 'tag added.' }
#       else
#         format.html { render :edit }
#       end
#     end
#   end

  private
    def set_pin
      @pin = Pin.find(params.require(:pintag).permit(:pin_id))
    end

    def pintag_params
      params.require(:pintag).permit(:pin_id, :tag_id)
    end

end
