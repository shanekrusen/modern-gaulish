class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user.bio.present?
      @bio = @user.bio
    end
  end
end
