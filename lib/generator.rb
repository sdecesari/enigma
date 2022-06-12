class Generator
  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def generate_key
    rand(99999).to_s.rjust(5, '0')
  end

  def split_keys
    key = generate_key
    {
      a_key: key[0..1].to_i,
      b_key: key[1..2].to_i,
      c_key: key[2..3].to_i,
      d_key: key[3..4].to_i
    }
  end

end
