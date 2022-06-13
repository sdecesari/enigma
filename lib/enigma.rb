class Enigma
  attr_reader :character_set
    def initialize
      @character_set = ("a".."z").to_a << " "
      @generator = Generator.new
    end

    def encrypt(message, key = nil, date = nil)
    random_key = @generator.generate_key
    todays_date = Time.new.strftime("%d/%m/%y").delete("/")
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
end
