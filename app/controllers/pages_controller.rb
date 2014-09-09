class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  layout 'landing'

  caches_page :show

  def show
    @page = Page.find(params[:id])

  def home
  end
end
