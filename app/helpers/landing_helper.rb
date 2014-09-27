module LandingHelper
  def render_team
    render partial: 'teams/landing_team_member', collection: User.all.includes(:avatar, :member_information), as: :member
  end
end
