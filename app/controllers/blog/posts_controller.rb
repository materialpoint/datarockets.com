class Blog::PostsController < ApplicationController
  skip_before_action :authenticate_user!

  layout 'application'

  def index
    @posts = Post.includes_all.reverse_all
  end

  def show
    @post = Post.find(params[:id])
  end
end
