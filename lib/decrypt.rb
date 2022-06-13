require './lib/enigma'
require './lib/generator'

input = File.open(ARGV[0], "r")
message_reader = input.read
input.close
output = File.open(ARGV[1], "w")
enigma = Enigma.new
decrypted_message = enigma.decrypt(message_reader, ARGV[2], ARGV[3])
output.write(decrypted_message[:decryption])
output.close
puts "\nCreated '#{ARGV[1]}' with the key #{ARGV[2]} and the date #{ARGV[3]}"
