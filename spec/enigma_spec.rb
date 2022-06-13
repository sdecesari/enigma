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

  it "can encrypt a message with a key and date" do
    result = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    expect(enigma.encrypt("hello world", "02715", "040895")).to be_a Hash
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq result
  end

  it "can decrypt a message with a key and date" do
    result = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to be_a Hash
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq result
  end

end
