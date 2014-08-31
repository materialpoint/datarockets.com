class Blog::PostsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

  layout 'blog'

  # GET /blog/posts
  def index
  end

  # GET /blog/posts/1
  def show
  end

  # GET /blog/posts/new
  def new
  end

  # GET /blog/posts/1/edit
  def edit
  end

  # POST /blog/posts
  def create
  end

  # PATCH/PUT /blog/posts/1
  def update
  end

  # DELETE /blog/posts/1
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_post
    end

    # Only allow a trusted parameter "white list" through.
    def blog_post_params
    end
end
