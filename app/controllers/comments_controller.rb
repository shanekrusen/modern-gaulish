class CommentsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params)
    
    if @post.user != current_user
      notification = UserNotification.create(notification: "A user has commented on your post:", user_id: @post.user.id, post_id: @post.id)
    end
    
    post_commenters = []
    
    @post.comments.each do |comment|
      post_commenters << comment.user
    end
    
    post_commenters = post_commenters.uniq
    
    post_commenters.each do |poster|
      if poster != current_user
        sibling_notification = UserNotification.create(notification: "A user has commented on a post that you are following:", user_id: poster.id, post_id: @post.id)
      end
    end
    
    redirect_to category_post_path(@category, @post)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:message, :category_id, :post_id, :user_id, :guest_name, :guest_email)
  end
end
