class BiosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def new
    @user = User.find(params[:user_id])
    @bio = Bio.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @user.create_bio(bio_params)
    redirect_to user_path(@user)
  end
  
  def edit
    @user = User.find(params[:user_id])
    @bio = Bio.find(params[:id])
  end
  
  def update
    @user = User.find(params[:user_id])
    @bio = Bio.find(params[:id])
    
    if @user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end
    
    @bio.update_attributes(bio_params)
    redirect_to user_path(@user)
  end
  
  private
  
  def bio_params
    params.require(:bio).permit(:bio)
  end
end
