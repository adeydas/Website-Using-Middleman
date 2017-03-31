###
# Page options, layouts, aliases and proxies
###
set :base_url, "https://abhishekdeydas.com/"
set :relative_links, true
set :markdown_engine, :kramdown

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###
helpers do
  def build_categories(articles)
    categories = []
    articles.each do |article|
      category = article.metadata[:page]['category']
      categories.push(category) unless categories.include? category
    end
    return categories
  end

  def build_categories_per_post(articles)
    posts = []
    articles.each do |article|
      posts.push(article) unless posts.include? article
    end
    return posts
  end

end

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  blog.permalink = "blog/{category}/{title}.html"
  # Matcher for blog source files
  blog.sources = "blog-posts/{year}-{month}-{day}-{title}.html"
  blog.taglink = "tags/{tag}.html"
  blog.layout = "blog_layout"
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  blog.year_link = "blog/{year}.html"
  blog.month_link = "blog/{year}/{month}.html"
  blog.day_link = "blog/{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"

  # Category
  blog.custom_collections = {
    category: {
      link: 'categories/{category}.html',
      template: 'category.html'
    }
  }

end

page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Compress output
  activate :gzip
end
