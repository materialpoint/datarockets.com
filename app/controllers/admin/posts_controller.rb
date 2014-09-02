class Admin::ProjectController < AdminController
  before_action :set_project, only: [:edit, :update, :destroy]
  before_action :authorize_project

  def index
    
  end
end
