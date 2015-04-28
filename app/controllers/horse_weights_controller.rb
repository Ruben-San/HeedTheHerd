class HorseWeightsController < ApplicationController
  def new
    @horse = Horse.find(params[:id])
    @horse_weight = @horse.horse_weights.build
  end

  def create
      @horse_weight = @horse.horse_weights.build(horse_weight_params)
      @horse_weight = current_user.horse_weights.build(horse_weight_params)
      @horse_weight.horse_id = horse.to_i

      if
        @horse_weight.save
      else
        render :new
      end
      redirect_to profile_path
  end

  private

  def horse_weights_params
    params.require(:horse_weight).permit(:id, :weight)
  end

end




