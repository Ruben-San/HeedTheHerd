class HorsesController < ApplicationController


  def show
  @horse= Horse.find(params[:id])
  end

  def new
    @horse = Horse.new
  end

  def create
    @horse = Horse.new(horse_params)
    if @horse.save
      redirect_to horse_path
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

  def delete
     @horse =Horse.find(params[:id])
    #if @horse.user == current_user
    #@horse.destroy
    #end
    #redirect_to horse_path
  end
end
