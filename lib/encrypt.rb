require './lib/enigma'
require './lib/generator'

input = File.open(ARGV[0], "r")
message_reader = input.read
input.close
output = File.open(ARGV[1], "w")
enigma = Enigma.new
encrypted_message = enigma.encrypt(message_reader)
output.write(encrypted_message[:encryption])
output.close
puts "\nCreated: '#{ARGV[1]}' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
