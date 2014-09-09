class Admin::PostsController < AdminController
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :authorize_post

  def index
    @posts = Post.all.reverse_all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    @post.save

    respond_with(@post, location: admin_posts_path)
  end

  def update
    @post.update(post_params)

    respond_with(@post, location: admin_posts_path)
  end

  def destroy
    @post.destroy

    respond_with(@post, location: admin_posts_path)
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def authorize_post
      authorize(:post, :manage?)
    end

    def post_params
      params.require(:post).permit(:title, :body, post_image_ids: [])
    end
end
