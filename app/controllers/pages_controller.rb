class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @page = Page.find(params[:id])
  end
end
