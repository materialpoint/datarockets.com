module ApplicationHelper
  require 'rouge'
  require 'rouge/plugins/redcarpet'
  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
    def block_code(code, language)
      Rouge.highlight(code, language || 'text', 'html')
    rescue RuntimeError
      Rouge.highlight(code, 'text', 'html')
    end
  end

  def markdown(text)
    render_options = {
      link_attributes: { rel: 'nofollow' }
    }

    extensions = {
      autolink: true,
      fenced_code_blocks: true,
      lax_spacing: true,
      no_intra_emphasis: true,
      strikethrough: true,
      superscript: true
    }

    renderer = HTML.new(render_options)
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end

  def class_for_header_logo
    case controller.controller_name
    when 'pages'
      'header__logo--white'
    when 'projects', 'posts', 'teams'
      'header__logo--black'
    end
  end

  def class_for_header_menu
    case controller.controller_name
    when 'pages'
      'header__menu--white'
    when 'projects', 'posts', 'teams'
      'header__menu--black'
    end
  end

  def class_for_menu_btn
    case controller.controller_name
    when 'pages', 'posts'
      'btn--red'
    when 'projects'
      'btn--blue'
    when 'teams'
      'btn--green'
    end
  end

  def class_for_line
    case controller.controller_name
    when 'teams'
      '--green'
    else
      '--blue'
    end
  end
end
