# frozen_string_literal: true

require_relative '../lib/scraper.rb'

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

start_app
