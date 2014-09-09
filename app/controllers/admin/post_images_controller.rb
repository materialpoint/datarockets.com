class Admin::PostImagesController < AdminController
  def create
    params[:post_image][:image].each do |image|
      params = {}
      params[:image] = image

      @post_image = PostImage.new(params)

      respond_to do |format|
        if @post_image.save
          format.html { redirect_to admin_posts_path }
          format.json { render :create }
        end
      end
    end
  end
end
