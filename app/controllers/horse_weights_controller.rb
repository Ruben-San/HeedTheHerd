class HorseWeightsController < ApplicationController
before_action :set_horse, except: [:create, :destroy]

  def index
  end

  def show
    @horse_weight = HorseWeight.find(params[:id])
  end

  def new
    @horse_weight = HorseWeight.new
  end

  def create
    @horse_weight = HorseWeight.new(horse_weights_params)
      if @horse_weight.save
      flash[:success] = "Weight updated"
      redirect_to(:back)
    else
      flash[:danger] = "Please fill in the field."
      render :new
    end
  end

  def destroy
    @horse_weight = HorseWeight.find(params[:id])
    # if current_user.id == @horse.user_id
    @horse_weight.destroy
      redirect_to(:back)
    #else
     #redirect_to profile_path
    #end
  end

  private

  def horse_weights_params
    params.require(:horse_weight).permit(:weight, :horse_id)
  end

  def set_horse
    @horse = Horse.find(params[:id])
  end
end