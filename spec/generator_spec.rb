require './lib/generator'
require 'pry'

RSpec.describe Generator do
  let(:generator) {Generator.new}

  it "exists" do
    expect(generator).to be_a Generator
  end

  it "can have an array of characters" do
    expect(generator.character_set).to be_a Array
    expect(generator.character_set.count).to eq (27)
  end

end
