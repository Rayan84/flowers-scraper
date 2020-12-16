require 'open-uri'
require 'nokogiri'
# creating the class scraper
class Scraper
  def start_app
    system('cls')
    system('clear')
    outputs(' ')
    outputs('  **** Flower Presents Shop! ****')
    outputs(' ')
    outputs('  In this application you can find a list of beautiful flowers bundle presents for different occations')
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
    puts flowers_string.class
    flowers = flowers_string.split(/\n+/)
    urls = urls_string.to_a
    listing(flowers, urls)
  end

  def listing(arr, links)
    1.upto(arr.length - 1) do |i|
      if i < 10
        outputs("  #{i}-   #{arr[i]}")
      elsif i < 100
        outputs("  #{i}-  #{arr[i]}")
      else
        outputs("  #{i}- #{arr[i]}")
      end
    end
    printing('  Pick a number to see the details:  ')
    number = ask.to_i - 1
    system('cls')
    system('clear')
    show_details(links[number], arr[number])
  end

  def show_details(link, title)
    details_doc = Nokogiri::HTML(URI.open(link))
    description = details_doc.xpath('//div[@id="ru-custom-h2"]').inner_text
    price = details_doc.css('div.product-price').first.inner_text.delete('₱,')
    price = price.to_i / 48
    printing("  #{title}")
    outputs("      price: $#{price}")
    outputs("  #{description}")
    outputs("More details on: #{link}")
    continue?
  end
end
