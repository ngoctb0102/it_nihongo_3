class UsersController < ApplicationController
  def index
    @users = User.search(params[:term])
    respond_to :js
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:photos)
    @saved = Post.joins(:bookmarks).where(user_id: current_user.id).
      includes(:photos) if @user == current_user
  end
end
