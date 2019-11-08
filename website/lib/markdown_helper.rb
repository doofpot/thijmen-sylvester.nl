module MarkdownHelper

  require 'middleman-core/renderers/redcarpet'

  class MyRenderer < Middleman::Renderers::MiddlemanRedcarpetHTML
    def initialize(options={})
      # p "MyRenderer"
      super
    end
 
    def image(link, title, alt_text)
      # p "image";
      if !@local_options[:no_images]
        # We add bootstrap centering and responsive class here
        scope.image_tag(link, title: title, alt: alt_text, class: 'img-responsive img-blog-single')
      else
        link_string = link.dup
        link_string << %("#{title}") if title && !title.empty? && title != alt_text
        "![#{alt_text}](#{link_string})"
      end
    end

  def header(text, level)
    # level += 1
    "<h#{level} class=\"color-primary\">#{text}</h#{level}>"
  end


    # def header(text, header_level)
    #   p text
    #   p header_level.to_s
    
    #   # scope.header_tag(text: text, header_level: header_level, class: 'color-primary')
    #   result = '<h#{header_level} class="color-primary">#{text}</h#{header_level}>'.render(html)
    # #   nil
    #   result
    # end
  # def paragraph(text)
  #   add_alerts("<p>#{text.strip}</p>\n")
  # end

  end
end