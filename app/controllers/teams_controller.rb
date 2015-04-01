class TeamsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @team = ComplexTeam.new
  end
end
