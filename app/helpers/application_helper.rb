module ApplicationHelper
  def markdown(text)
    options = {
      hard_wrap: true, autolink: true, no_intra_emphasis: true, tables: true, fenced_code_blocks: true,
      disable_indented_code_blocks: true, strikethrough: true, lax_spacing: true, space_after_headers: true,
      quote: true, footnotes: true, highlight: true, underline: true
    }
    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(text)
  end
end
