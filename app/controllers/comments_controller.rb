class CommentsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params)
    redirect_to category_post_path(@category, @post)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:message, :category_id, :post_id, :user_id)
  end
end
