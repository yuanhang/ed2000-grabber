require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.ed2000.com/ShowFile.asp?vid=2751889'))


links = []
doc.css(".CommonListCell td a[href^='ed2k']").each do |link|
  puts link['href']
  links << link['href']
end

File.open('links.txt', 'w+') do |f|
  f.puts(links)
end