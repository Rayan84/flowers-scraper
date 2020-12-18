require 'rspec'
require 'stringio'
require_relative '../bin/public.rb'

describe '#outputs' do
  let(:text) { 'Hello!' }
  it "Prints out 'Hello'" do
  end
  specify { expect { outputs(text) }.to output.to_stdout }
end

describe '#printing' do
  let(:text) { 'Hello!' }
  it "Prints out 'Hello'" do
  end
  specify { expect { printing(text) }.to output.to_stdout }
end

describe '#ask' do
  it 'Prompts user to enter an input and it returns the input' do
    input = StringIO.new('q')
    $stdin = input
    expect(ask).to eq('q')
  end
end
