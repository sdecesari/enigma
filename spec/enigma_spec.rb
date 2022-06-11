require './lib/enigma'
require 'pry'

RSpec.describe Enigma do
  let(:enigma) {Enigma.new}

  it "exitsts" do
    expect(enigma).to be_a Enigma
  end

end
