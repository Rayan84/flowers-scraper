require 'open-uri'
require 'nokogiri'

puts 'scraper here...'
puts ''
puts ''
url = 'https://newyork.craigslist.org/d/computer-gigs/search/cpg'
#unparsed_page = URI.open(url).read

#parsed_page = Nokogiri::HTML(unparsed_page)
#puts parsed_page

#jobs = parsed_page.css('.result-info').inner_html
#(jobs.length - 1).times do |i|
#print jobs[i]

#end
