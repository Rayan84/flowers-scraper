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
  quest
end
system('cls')
system('clear')
scraper.start_app
