require_relative '../bin/main.rb'
require_relative '../lib/scraper.rb'
require 'rspec'

describe Scraper do
  let(:scraper) { Scraper.new }

  # describe '#start_app' do
  #  it 'Starts the application' do
  #    expect(scraper.start_app).to be_an_instance_of(Scraper)
  #  end
  # end

  #  describe '#flower_list' do
  #    it 'Open the provided link and parse the HTML content' do
  #      expect(scraper.flower_list()).(Scraper)

  #      end
  #    end

  describe '#validate_num' do
    it 'Open the provided link and parse the HTML content' do
      let(:gets) { '10' }
      expect(scraper.validate_num).to eq(num)
    end
  end
end
