class PostsController < ApplicationController
  def index
    # @posts = Post.all
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end
end
