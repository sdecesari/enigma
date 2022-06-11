require './lib/enigma'
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

  it "generate a random key" do
    expect(enigma.generate_key).to be_a String
    expect(enigma.generate_key.length).to eq 5
  end

end
