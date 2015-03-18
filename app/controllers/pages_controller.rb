class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  layout 'application'

  def show
    @page = Page.find(params[:id])
  end

  def home
  end
end
