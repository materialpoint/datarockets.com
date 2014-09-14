class Admin::PostImagesController < AdminController
  def create
    @post_image = PostImage.new(post_image_params)

    unless @post_image.save
      render nothing: true, status: 500
    end
  end

  private

    def post_image_params
      params.require(:post_image).permit(:image)
    end
end
