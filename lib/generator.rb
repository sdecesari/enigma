class Generator
  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def generate_key
    rand(99999).to_s.rjust(5, '0')
  end

  def split_keys(key)
    {
      a_key: key[0..1].to_i,
      b_key: key[1..2].to_i,
      c_key: key[2..3].to_i,
      d_key: key[3..4].to_i
    }
  end

  def todays_date
    Time.new.strftime("%d/%m/%y").delete("/").to_i
  end

  def split_offset(date)
    sqr = (date.to_i ** 2).to_s
    digit = sqr[-4..-1]
    digit.split("")
    {
      a_offset: digit[0].to_i,
      b_offset: digit[1].to_i,
      c_offset: digit[2].to_i,
      d_offset: digit[3].to_i
    }
  end

  def combine(key, date)
    key = split_keys(key)
    offset = split_offset(date)
    {
      A: key[:a_key] + offset[:a_offset],
      B: key[:b_key] + offset[:b_offset],
      C: key[:c_key] + offset[:c_offset],
      D: key[:d_key] + offset[:d_offset]
    }
  end

  def rotate(shift)
    rotate = @character_set.rotate(shift)
    @character_set.zip(rotate).to_h
  end

end
