require './lib/enigma'
require './lib/generator'
require 'pry'

RSpec.describe Enigma do
  let(:enigma) {Enigma.new}

  it "exitsts" do
    expect(enigma).to be_a Enigma
  end

  it "can have an array of characters" do
    expect(enigma.character_set).to be_a Array
    expect(enigma.character_set.count).to eq (27)
  end

end
