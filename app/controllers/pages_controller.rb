class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  layout 'landing'

  caches_page :show

  def show
    @page = Page.find(params[:id])
  end

  def home
  end
end
