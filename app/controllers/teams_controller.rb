class TeamsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @team = User.all.includes(:member_information)
  end
end
