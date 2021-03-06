# ----- Compass -----

# compass_config do |config|
#   config.output_style = :compact
# end

# ----- Page options, layouts, aliases and proxies -----

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

base_dir = File.expand_path(File.dirname(__FILE__))
require "#{base_dir}/lib/base"

set :helpers_dir, "./lib/helpers"
set :source     , "src"
set :build_dir  , "out"
set :js_dir     , "javascripts"
set :css_dir    , "stylesheets"
set :images_dir , "images"

configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
