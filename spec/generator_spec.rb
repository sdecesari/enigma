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

  it "can generate a random key" do
    expect(generator.generate_key).to be_a String
    expect(generator.generate_key.length).to eq 5
  end

  it "can create a hash of keys" do
    expect(generator.split_keys).to be_a Hash
    expect(generator.split_keys.values.count).to eq 4
  end

  it "can generate a date" do
    expect(generator.todays_date).to be_a Array
    expect(generator.todays_date.length).to eq 4
  end

  it "can create a hash of split offset" do
    expect(generator.split_offset).to be_a Hash
    expect(generator.split_offset.length).to eq 4
  end

  it "can shift" do
    expect(generator.shift).to be_a Hash
    expect(generator.shift.length).to eq 4
  end

end
