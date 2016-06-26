class UserNotificationsController < ApplicationController
  def destroy
    @notification = UserNotification.find(params[:id])
    @notification_post = @notification.post
    @notification.destroy
    redirect_to category_post_path(@notification_post.category, @notification_post)
  end
end
