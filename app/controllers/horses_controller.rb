class HorsesController < ApplicationController
  before_action :authenticate_user!


  def show
  @horse= Horse.find(params[:id])
  end

  def new
    

    @horse = Horse.new
  end

  def create
    @horse = Horse.new(horse_params)
    if @horse.save
      redirect_to profile_path
    else
      render :new
    end  
  end


  def edit
    @horse =Horse.find(params[:id])
     #if @product.user != current_user
      #redirect_to products_path
    #end
  end

  def update
    @horse = Horse.find(params[:id])
    if @horse.update(horse_params)
       redirect_to horse_path
    else
      render :edit 
    end
  end

  def destroy 
    @horse = Horse.find(params[:id])
    @horse.destroy
    redirect_to profile_path
  end

  private

  def horse_params
    params.require(:horse).permit(:name, :breed, :height, :weight, :DOB, :RHR, :gender, :user_id, :pic)
end

end
