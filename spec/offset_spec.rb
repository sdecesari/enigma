require './lib/offset'
require 'pry'

RSpec.describe Offset do
  let(:offset) {Offset.new}

  it "exists" do
    expect(offset).to be_a Offset
  end
end
