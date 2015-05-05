class HorseWeightsController < ApplicationController


  def index
  end

  def show
    @horse_weight = HorseWeight.find(params[:id])
  end

  def new

    @horse = Horse.find(params[:id])
    @horse_weight = HorseWeight.new
    respond_to do |format|
        format.html
        format.js
    end     

  end

  def create
    @horse_weight = HorseWeight.new(horse_weights_params)
      if @horse_weight.save
      flash[:success] = "Weight updated"
      redirect_to horse_path(@horse_weight.horse_id) 
    else
      flash[:danger] = "Please fill in the field."
      render :new
    end
  end

  def destroy
    @horse_weight = HorseWeight.find(params[:id])
    # if current_user.id == @horse.user_id
    @horse_weight.destroy
      redirect_to horse_path(@horse_weight.horse_id)
    #else
     #redirect_to profile_path
    #end
  end

  private

  def horse_weights_params
    params.require(:horse_weight).permit(:weight, :horse_id)
  end
end