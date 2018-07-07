require './lib/braille_translator.rb'

class NightWriter

ARGV == ["string_1", "string_2"]
ARGV[0] == ("string_1")
ARGV[1] == ("string_2")

message = File.open(ARGV[0], "r")
speech_string = message.read
characters = speech_string.chars
character_count = (characters.count - 1)

braille_translator = BrailleTranslator.new
binary_translation = braille_translator.translate(speech_string)

message.close


braille = File.open(ARGV[1], "w")
braille.write(binary_translation)

braille.close

puts "Created '#{ARGV[1]}' containing #{character_count} characters."
end
