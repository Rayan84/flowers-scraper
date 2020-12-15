# frozen_string_literal: true
require 'open-uri'
require 'nokogiri'
require 'byebug'

def start_app
  system('cls')
  system('clear')
  outputs(' ')
  outputs('  **** Welcome! ****')
  outputs(' ')
  outputs('  In this application you can find a wide list of beautiful flowers bundles to give as presents on different occations')
  continue?
end

def continue?
  printing('  Press "Enter" to see the list...')
  answer = ask
  flower_list if answer == ''
end

def flower_list
  doc = Nokogiri::HTML(URI.open('https://flowerstore.ph/'))
  flowers_string = doc.css('h2.product-title').inner_text
  urls_string = doc.xpath('//div[@class="tab-pane"]/div/div/div/a/@href')
  flowers = flowers_string.split(/\n+/)
  urls = urls_string.to_a
  flowers = flowers.reject(&:empty?)
  looping(flowers, urls)
end

def looping(flowers_arr, links)
  0.upto(flowers_arr.length - 1) do |i|
    if i < 10
      outputs("  #{ i + 1 }-   #{ flowers_arr[i] }")
    elsif i < 100
      outputs("  #{i + 1}-  #{flowers_arr[i]}")
    else
      outputs("  #{i + 1}- #{flowers_arr[i]}")
    end
  end
   printing('  Pick a number to see the details:  ')
   number = (ask.to_i) - 1
   system('cls')
   system('clear')
   show_details(links[number], flowers_arr[number])
end

def show_details(link, title)
  details_doc = Nokogiri::HTML(URI.open(link))
  description = details_doc.xpath('//div[@id="ru-custom-h2"]').inner_text
  outputs''
  outputs("  #{title}")
  outputs''
  outputs("  #{description}")
  outputs''
  continue?
end
