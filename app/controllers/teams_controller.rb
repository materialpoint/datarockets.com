class TeamsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @members = User.members
  end
end
