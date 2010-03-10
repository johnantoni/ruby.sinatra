require 'rubygems'
require 'builder'
require 'sinatra'

set :root, File.dirname(__FILE__)

configure do
  @@url = "http://www.mysite.com"
  @@cdn = "http://cdn.cloudfront.com"
end


["/", "/index.html"].each do |path|
  get path do
    response.headers['Cache-Control'] = "public, max-age=86400"
    erb :index, :locals => {:cdn => @@cdn}
  end
end

get "/sitemap.xml" do
  response.headers['Cache-Control'] = "public, max-age=86400"
  content_type 'application/xml', :charset => 'utf-8'
  @url = @@url
  builder :sitemap
end

get "/vcard.vcf" do
  erb :vcard
end

not_found do
  # catch all
  response.headers['Cache-Control'] = "public, max-age=86400"
  erb :index, :locals => {:cdn => @@cdn}
end


#---------------------------------------------------------------

get "/robots.txt" do
  response.headers['Cache-Control'] = "public, max-age=86400"
  content_type 'text/plain', :charset => 'utf-8'
  "User-agent: *\nSitemap: #{@@url}/sitemap.xml"
end

# Google Apps Validator
get "/googlehostedservice.html" do
  response.headers['Cache-Control'] = "public, max-age=86400"
  content_type 'text/plain', :charset => 'utf-8'
  "googlefffffffff4f889cc"
end

# Google Sitemap Validator
get "/google5211c1682bfa1956.html" do
  response.headers['Cache-Control'] = "public, max-age=86400"
  content_type 'text/plain', :charset => 'utf-8'
  ""
end

# Yahoo Web Master Tools validator
get "/y_key_2d6e2f2b210a1cc7.html" do
  response.headers['Cache-Control'] = "public, max-age=86400"
  content_type 'text/plain', :charset => 'utf-8'
  '<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN"><HTML><HEAD><TITLE></TITLE><BODY><!-- 05dacd3223048821  --></BODY></HTML>'
end