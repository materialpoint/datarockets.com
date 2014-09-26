class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  caches_page :show, :home

  def show
    @page = Page.find(params[:id])
  end

  def home
  end
end
