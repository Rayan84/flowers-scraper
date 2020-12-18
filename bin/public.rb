require_relative '../lib/scraper.rb'

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
