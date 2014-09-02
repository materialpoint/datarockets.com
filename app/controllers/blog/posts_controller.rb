class Blog::PostsController < ApplicationController
  skip_before_action :authenticate_user! 

  layout 'blog'

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end
end
