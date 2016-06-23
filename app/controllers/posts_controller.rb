class PostsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @category.posts.create(post_params)
    redirect_to category_path(@category)
  end
  
  def show
    @category = Category.find(params[:category_id])
    @post = @category.posts.find(params[:id])
    @comment = Comment.new
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :guest_name, :guest_email)
  end
end
