class HorseWeightsController < ApplicationController
before_action :set_horse, except: :create
before_action :set_horse_weight , only: [:destroy]

  def new
    @horse_weight = HorseWeight.new
  end

  def create
    @horse_weight = HorseWeight.new(horse_weights_params)
      if @horse_weight.save
      flash[:success] = "Weight updated"
      redirect_to profile_path
    else
      flash[:danger] = "Please fill in the field."
      render :new
    end
    # @horse_weight = @horse.horse_weights.build(horse_weights_params)
  end

  def destroy

  end

  private

  def horse_weights_params
    params.require(:horse_weight).permit(:weight, :horse_id)
  end

  def set_horse
    @horse = Horse.find(params[:id])
  end

  def set_horse_weight
    @horse_weight = HorseWeight.find(params[:id])
  end
end