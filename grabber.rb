require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.ed2000.com/ShowFile.asp?FileID=166734'))

doc.css(".CommonListCell td a[href^='ed2k']").each do |link|
  puts link['href']
  # puts link.content
end