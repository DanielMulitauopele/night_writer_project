require './lib/braille_translator.rb'
require 'pry'
class NightWriter

# This receives inputs from the command line
ARGV == ["input_1", "output_1"]
ARGV[0] == ("input_1")
ARGV[1] == ("output_1")

# This reads the file that ARGV[0] recieved
message = File.open(ARGV[0], "r")
message_text = message.read

# This is where we are doing actions to the text that we read
characters = message_text.chars
character_count = (characters.count - 1)

braille_translator = BrailleTranslator.new
braille_translation = braille_translator.translate(message_text)

message.close

# This is where we paste all the conversions we've done so far
braille = File.open(ARGV[1], "w")
braille.write(braille_translation)

braille.close

puts "Created '#{ARGV[1]}' containing #{character_count} characters."
end
