require 'pry'

class NightWriter

ARGV == ["string_1", "string_2"]
ARGV[0] == "string_1"
ARGV[1] == "string_2"

message_reader = File.open(ARGV[0], "r")
incoming_text = message_reader.read

word_count = incoming_text.split.count
message_reader.close

capitalized_text = incoming_text.upcase

message_writer = File.open(ARGV[1], "w")
message_writer.write(capitalized_text)

puts word_count
puts "Created '#{ARGV[1]}' containing #{word_count} characters."

end
