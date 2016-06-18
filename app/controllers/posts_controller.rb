class PostsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @category.posts.create(post_params.merge(user: current_user))
    redirect_to category_path(@category)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
