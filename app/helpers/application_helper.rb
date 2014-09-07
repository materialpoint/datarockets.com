module ApplicationHelper
  class HTML < Redcarpet::Render::HTML
    def block_code(code, language)
      Rouge.highlight(code, language || 'text', 'html')
    end
  end

  def markdown(text)
    render_options = {
      filter_html: true,
      hard_wrap: true,
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
end
