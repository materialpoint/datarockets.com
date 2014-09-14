module ApplicationHelper
  def markdown(text)
    options = {
      filter_html: true,
      hard_wrap: true,
      link_attributes: {},
      space_after_headers: true,
      fenced_code_blocks: true,
      tables: true
    }

    extensions = {
      autolink: true,
      superscript: true,
      disable_indented_code_blocks: true,
      tables: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end

  def class_for_header
    case params[:controller]
    when 'pages'
      '--white'
    when 'projects', 'blog/posts', 'teams', 'admin', 'admin/pages', 'admin/posts', 'admin/users'
      '--black'
    end
  end

  def class_for_btn
    case params[:controller]
    when 'pages', 'blog/posts', 'admin', 'admin/pages', 'admin/posts', 'admin/users'
      '--red'
    when 'projects'
      '--blue'
    when 'teams'
      '--green'
    end
  end

  def class_for_line
    case params[:controller]
    when 'teams'
      '--green'
    when 'admin', 'blog/posts', 'admin/pages', 'admin/posts', 'admin/users'
      '--red'
    when 'projects'
      '--blue'
    end
  end
end
