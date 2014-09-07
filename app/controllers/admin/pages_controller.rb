class Admin::PagesController < ApplicationController
  before_action :set_page, only: [ :edit, :update, :destroy ]

  def index
    @pages = Page.all.order(created_at: :desc)
  end

  def new
    @page = Page.new
  end

  def create
    Page.create(page_params)
    respond_with(@page)
  end

  def edit

  end

  def update
    Page.update(page_params)
    respond_with(@page)
  end

  def destroy
    Page.destroy
    respond_with(@page)
  end

private

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit([:title,:body])
  end




end
