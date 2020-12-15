require 'open-uri'
require 'nokogiri'
require 'byebug'


def start_app
  system('cls')
  system('clear')
  outputs(' ')
  outputs('  **** Welcome! ****')
  outputs(' ')
  outputs('  In this application you can find a wide list of beautiful flowers bundles')
  printing('  Press "Enter" to see the list...')
  continue?
end

def continue?
  answer = ask
  if answer == ''
    flowers_list
  end
end

def flowers_list
  doc = Nokogiri::HTML(URI.open('https://flowerstore.ph/'))
  flowers_string = doc.css('h2.product-title').inner_text
  urls_string = doc.xpath('//div[@class="tab-pane"]/div/div/div/a/@href')
  flowers = flowers_string.split(/\n+/)
  urls = urls_string.to_a
  print flowers_string
  puts
  puts
  flowers = flowers.reject { |c| c.empty? }
  #urls = urls.reject { |c| c.empty? }
  puts flowers.count
  puts urls.count
  looping(flowers, urls)
end

def looping(flowers_arr, links)
  1.upto(flowers_arr.length - 1) do |i|
    if i < 10
    #  outputs(" #{ i }  - #{ flowers_arr[i] }     #{ links[i-1] }")
    elsif i < 100
    #  outputs(" #{i} - #{flowers_arr[i]}    #{links[i-1]}")
    else
    #  outputs(" #{i}- #{flowers_arr[i]}    #{links[i-1]}")
    end
  end
  outputs('  Pick a number to see the details')
  number = (ask.to_i) - 1
  system('cls')
  system('clear')
  outputs(flowers_arr[number])
  show_details(links[number], number)
end

def show_details(link, num)
  details_doc = Nokogiri::HTML(URI.open(link))
  #description = details_doc.xpath('//div[@id="product-card"]/a/@href')
  #puts details_doc
  description = details_doc.css('#ru-custom-h2 > ul > li').inner_text
  outputs(description)
end
