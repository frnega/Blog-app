class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
    else
      @posts = @user.posts
      render :show, locals: { user: @user, posts: @posts }
    end
  end
end
