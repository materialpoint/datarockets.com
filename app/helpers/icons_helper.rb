module IconsHelper
  def render_social_icons_for(user)
    html = ''
    %i(github_profile twitter linkedin own_blog).each do |social|
      html += link_to social, user.member_information.send(social) if user.member_information.send(social).present?
    end
    html.html_safe
  end
end
