class NightWriter

ARGV == ["string_1", "string_2"]
ARGV[0] == ("string_1")
ARGV[1] == ("string_2")

message = File.open(ARGV[0], "r")
speech_string = message.read
character_count = speech_string.chars.count
p character_count

message.close

braille = File.open(ARGV[1], "w")
braille.write(character_count)
braille.close
end
