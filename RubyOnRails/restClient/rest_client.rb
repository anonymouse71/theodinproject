require 'rest_client'
require 'nokogiri'
puts "Below are all the cool animes from Manga Panda:"
url = "http://www.mangapanda.com/alphabetical"
page = Nokogiri::HTML(RestClient.get(url))

anime_list = page.css("a")
anime_list.eacitem {|item| puts item.text}
