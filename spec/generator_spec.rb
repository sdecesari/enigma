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
    expect(generator.split_keys('02715')).to be_a Hash
    expect(generator.split_keys('02715')).to eq ({:a_key=>2, :b_key=>27, :c_key=>71, :d_key=>15})
    expect(generator.split_keys('02715').values.count).to eq 4
  end

  it "can generate a date" do
    date = Time.new.strftime("%d/%m/%y").delete("/").to_i
    expect(generator.todays_date).to be_a Integer
    expect(generator.todays_date).to eq date
  end

  it "can create a hash of split offset" do
    expect(generator.split_offset('040895')).to be_a Hash
    expect(generator.split_offset('040895')).to eq ({:a_offset=>1, :b_offset=>0, :c_offset=>2, :d_offset=>5})
    expect(generator.split_offset('040895').length).to eq 4
  end

  it "can combine key and offset" do
    expect(generator.combine('02715','040895')).to be_a Hash
    expect(generator.combine('02715','040895').length).to eq 4
  end

  it "can rotate" do
    expect(generator.rotate(1)).to be_a Hash
    expect(generator.rotate(3)["a"]).to eq "d"
    expect(generator.rotate(2)["f"]).to eq "h"
    expect(generator.rotate(26)["u"]).to eq "t"
  end

end
