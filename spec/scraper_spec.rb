require 'rspec'
require 'stringio'
require '../bin/public.rb'

describe Scraper do
  let(:scraper) { Scraper.new }

  describe '#start_app' do
    it "Returns : system('exit') " do
      input = StringIO.new('q')
      $stdin = input
      expect(scraper.start_app).to eq(system('exit'))
    end
  end

  describe '#flower_list' do
    it 'Calls listing method and passes in two arguments' do
      input = StringIO.new('')
      input.puts '12'
      input.puts 'q'
      $stdin = input
      input.rewind
      expect(scraper.flower_list).to eql(true)
    end
  end

  describe '#validate_num' do
    it 'Returns user input number if its within range of 1..127' do
      input = StringIO.new('10')
      $stdin = input
      expect(scraper.validate_num).to eq(10)
    end
  end

  describe '#show_details' do
    let(:link) { 'https://flowerstore.ph/product/beautiful-you' }
    it "Returns : system('exit') " do
      input = StringIO.new('q')
      $stdin = input
      expect(scraper.show_details(link, 'Beautiful You')).to eq(system('exit'))
    end
  end
end
