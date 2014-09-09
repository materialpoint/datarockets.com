class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  caches_page :show

  def show
    @page = Page.find(params[:id])
  end
end
