class Enigma
  attr_reader :character_set
    def initialize
      @character_set = ("a".."z").to_a << " "
      @generator = Generator.new
    end

  def encrypt(message, key = @generator.generate_key, date = Time.new.strftime("%d/%m/%y").delete("/"))
  message_array = message.downcase.split("")
  a_shift = @generator.rotate(@generator.combine(key, date)[:A])
  b_shift = @generator.rotate(@generator.combine(key, date)[:B])
  c_shift = @generator.rotate(@generator.combine(key, date)[:C])
  d_shift = @generator.rotate(@generator.combine(key, date)[:D])
  counter = 0
  encrypted_message = []
    message_array.each do |letter|
      if counter == 0
        encrypted_message << a_shift[letter]
        counter += 1
      elsif counter == 1
        encrypted_message << b_shift[letter]
        counter += 1
      elsif counter == 2
        encrypted_message << c_shift[letter]
        counter += 1
      elsif counter == 3
        encrypted_message << d_shift[letter]
        counter = 0
      end
      encrypted_message
    end
  {
    encryption: encrypted_message.join,
    key: key,
    date: date
  }
  end

  def decrypt(cyphertext, key, date = todays_date = Time.new.strftime("%d/%m/%y").delete("/"))
      message_array = cyphertext.downcase.split("")
      a_shift = @generator.rotate(@generator.combine(key, date)[:A] * -1)
      b_shift = @generator.rotate(@generator.combine(key, date)[:B] * -1)
      c_shift = @generator.rotate(@generator.combine(key, date)[:C] * -1)
      d_shift = @generator.rotate(@generator.combine(key, date)[:D]* -1)
      counter = 0
      decrypted_message = []
        message_array.each do |letter|
          if counter == 0
            decrypted_message << a_shift[letter]
            counter += 1
          elsif counter == 1
            decrypted_message << b_shift[letter]
            counter += 1
          elsif counter == 2
            decrypted_message << c_shift[letter]
            counter += 1
          elsif counter == 3
            decrypted_message << d_shift[letter]
            counter = 0
          end
          decrypted_message
        end
      {
        decryption: decrypted_message.join,
        key: key,
        date: date
      }
  end

end
