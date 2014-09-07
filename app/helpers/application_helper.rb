module ApplicationHelper
  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true,
      tables: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true,
      tables: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end

  def class_for_header_logo
    case controller.controller_name
    when 'pages'
      'header__logo--white'
    when 'projects', 'posts'
      'header__logo--black'
    end
  end

  def class_for_header_menu
    case controller.controller_name
    when 'pages'
      'header__menu--white'
    when 'projects', 'posts'
      'header__menu--black'
    end
  end

  def class_for_menu_btn
    case controller.controller_name
    when 'pages', 'posts'
      'btn--red'
    when 'projects'
      'btn--blue'
    end
  end
end
