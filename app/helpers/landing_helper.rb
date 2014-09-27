module LandingHelper
  def render_team
    render partial: 'teams/landing_team_member', collection: User.includes_all, as: :member
  end
end
