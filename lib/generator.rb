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

  def todays_date
    date = Time.new.strftime("%d/%m/%y").delete("/").to_i
    sqr = (date ** 2).to_s
    digit = sqr[-4..-1]
    digit.split("")
  end

  def split_offset
    offset = todays_date
    {
      a_offset: offset[0].to_i,
      b_offset: offset[1].to_i,
      c_offset: offset[2].to_i,
      d_offset: offset[3].to_i
    }
  end

end
