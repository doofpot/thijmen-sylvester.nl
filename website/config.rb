
# require 'lib/markdown_helper'
# helpers MarkdownHelper


activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end


set :css_dir,     'stylesheets'
set :fonts_dir,   'fonts'
set :images_dir,  'images'
set :js_dir,      'javascripts'
set :sass_assets_paths, 'stylesheets'

set :layouts_dir, 'layouts'

###
# Page options, layouts, aliases and proxies
###
# set :markdown_engine, :redcarpet
# set :markdown, :fenced_code_blocks => true, :smartypants => true


activate :directory_indexes
activate :automatic_image_sizes
activate :sprockets

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
# page "/pages/*.html",  layout: "layouts/layoutstatic"
page "/pages/*.html",  layout: "layouts/layoutblogsingle"
# page '/blog/*.html', :layout => "layouts/layoutblogsingle"


# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###



activate :blog do |blog|
  blog.prefix        = "blog"

  # Enable pagination
  blog.paginate     = true
  blog.per_page     = 8
  blog.page_link    = "page/{num}"
  # blog.pageable     = true
  # blog.per_page     = 1

  blog.permalink = "{year}/{year}-{month}-{day}-{title}.html"
  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  blog.sources = "{year}/{year}-{month}-{day}-{title}.html"

  # blog.taglink = "tags/{tag}.html"
  blog.layout = "layouts/layoutblogsingle"
  blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  blog.day_link = "{year}-{month}-{day}-{title}.html"
  blog.default_extension = ".markdown"

  blog.taglink = 'tags/{tag}.html'
  blog.tag_template = "tag.html"

  blog.calendar_template = "calendar.html"

end

# voorbeeld voor pagination haml script.
# http://www.slevenbits.com/blog/2013/01/middleman-blog-pagination.html

page "/feed.xml", layout: false

# activate :sitemap 

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-48144184-7' # Replace with your property ID.

  # Removing the last octet of the IP address (default = false)
  ga.anonymize_ip = false

  # Tracking across a domain and its subdomains (default = nil)
  ga.domain_name = 'thijmen-sylvester.nl'

  # Tracking across multiple domains and subdomains (default = false)
  ga.allow_linker = false

  # Enhanced Link Attribution (default = false)
  ga.enhanced_link_attribution = false

  # Tracking Code Debugger (default = false)
  ga.debug = false

  # Tracking in development environment (default = true)
  # ga.development = false

  # Compress the JavaScript code (default = false)
  ga.minify = false

  # Output style - :html includes <script> tag (default = :html)
  ga.output = :js

end



# Methods defined in the helpers block are available in templates
helpers do

  # def image_tag( path, params = {} )
  #   blog_prefix = blog_controller.try(:options).try(:prefix).try(:gsub, "/", "")
  #   if current_path =~ %r{^#{blog_prefix}}
  #     classes = params[:class].try(:split, " ") || []
  #     classes << "img-responsive img-blog-single"
  #   end
  #   params[:class] = classes.try(:join, "")
  #   super( path, params )
  # end

  def some_helper
    "Helping"
  end
end

activate :deploy do |deploy|
  # ...
  # deploy.build_before = true # default: false

  # deploy.deploy_method   = :sftp
  deploy.deploy_method   = :rsync
  deploy.host            = 'box.business-mail.nl'
  # deploy.port            = 22
  deploy.path            = '/var/www/thijmen-sylvester.nl'
  # Optional Settings
  deploy.user     = 'sander' # no default
  # deploy.password = 'secret' # no default
  # deploy.flags = '-avz --no-p --no-g -t' # add custom flags, default: -avz
  # deploy.flags = '-avz --no-p --no-g -t' # add custom flags, default: -avz
  # deploy.flags = '-avz -m --chown=ts-2:ts-2' # add custom flags, default: -avz
  deploy.flags = '-avz ' # add custom flags, default: -avz
  # deploy.flags = '-rltgoDvzO --no-p --del' # add custom flags, default: -avz
  deploy.clean = false
  # deploy.verbose = true

end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
  # activate :search_engine_sitemap
  # activate :robots, :rules => [
  #   {:user_agent => '*', :allow => %w(/)}
  # ]
end


configure :development do
  # set :debug_assets, true
  activate :livereload
end

# configure :build do
  # set :build_dir, 'some-path/' #optional

# end
# activate :dexterity
# activate :middleman_simple_thumbnailer

