require 'open-uri'
require 'nokogiri'

# creating the class scraper
class Scraper
  def initialize; end

  def start_app
    system('cls')
    system('clear')
    outputs(' ')
    outputs('  **** Flower Gift Shop! ****')
    outputs(' ')
    outputs('  In this application you can find a list of beautiful flowers bundle presents for different occations')
    continue?
  end

  def continue?
    outputs ''
    printing('  Press enter to see the list, q to quit..:  ')
    answer = ask
    if answer == 'q'
      abort '  Goodbye...'
    elsif answer == ''
      flower_list
    else
      continue?
    end
  end

  def flower_list
    doc = Nokogiri::HTML(URI.open('https://flowerstore.ph/'))
    flowers_string = doc.css('h2.product-title').inner_text
    urls_string = doc.xpath('//div[@class="tab-pane"]/div/div/div/a/@href')
    flowers = flowers_string.split(/\n+/)
    urls = urls_string.to_a
    listing(flowers, urls)
  end

  def listing(arr, links)
    0.upto(126) do |i|
      if i < 10
        outputs("  #{i + 1}-   #{arr[i + 1]}")
      elsif i < 100
        outputs("  #{i + 1}-  #{arr[i + 1]}")
      else
        outputs("  #{i + 1}- #{arr[i + 1]}")
      end
    end

    printing('  Pick a number to see the details:  ')
    number = validate_num
    system('cls')
    system('clear')
    show_details(links[number - 1], arr[number])
  end

  def validate_num
    num = ask.to_i
    if (1..127).include? num
      num
    else
      printing '  Plsease enter a number from 1 to 127: '
      validate_num
    end
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
