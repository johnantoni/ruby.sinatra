xml.instruct!
xml.urlset :xmlns => 'http://www.sitemaps.org/schemas/sitemap/0.9' do

  xml.url do
    xml.loc "#{@url}/index.html"
    xml.lastmod Time.now().xmlschema
  end

end
