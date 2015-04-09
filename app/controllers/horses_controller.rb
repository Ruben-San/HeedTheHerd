class HorsesController < ApplicationController

  def show
  @horse= Horse.find(params[:id])
  end
