class Admin::PagesController < AdminController
  before_action :set_page, only: [ :edit, :update, :destroy ]
  before_action :authorize_page!

  def index
    @pages = Page.reverse_all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.create(page_params)

    respond_with(@page, location: admin_pages_path)
  end

  def edit
  end

  def update
    @page.update(page_params)

    expire_page controller: '/pages', action: :show, id: @page

    respond_with(@page, location: admin_pages_path)
  end

  def destroy
    @page.destroy

    respond_with(@page, location: admin_pages_path)
  end

  private

    def set_page
      @page = Page.find(params[:id])
    end

    def authorize_page!
      authorize(:page, :manage?)
    end

    def page_params
      params.require(:page).permit(:title,:body)
    end
end
