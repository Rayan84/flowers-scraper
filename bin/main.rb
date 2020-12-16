require_relative '../lib/scraper.rb'
scraper = Scraper.new
def outputs(text)
  puts(text)
end

def printing(text)
  print text
end

def ask
  quest = gets.chomp
  puts quest
  quest
end

scraper.start_app
