module ApplicationHelper
  class HTML < Redcarpet::Render::HTML
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

  def class_for_header
    case params[:controller]
    when 'pages'
      '--white'
    when 'projects', 'questions', 'blog/posts', 'teams', 'admin', 'admin/pages', 'admin/posts', 'admin/users', 'admin/questions', 'admin/projects'
      '--black'
    end
  end

  def class_for_btn
    case params[:controller]
    when 'pages', 'blog/posts', 'admin', 'admin/pages', 'admin/posts', 'admin/users', 'admin/questions', 'admin/projects'
      '--red'
    when 'projects', 'questions'
      '--blue'
    when 'teams'
      '--green'
    end
  end

  def class_for_line
    case params[:controller]
    when 'teams'
      '--green'
    when 'admin', 'blog/posts', 'admin/pages', 'admin/posts', 'admin/users', 'admin/questions', 'admin/projects'
      '--red'
    when 'projects', 'questions'
      '--blue'
    end
  end
end
