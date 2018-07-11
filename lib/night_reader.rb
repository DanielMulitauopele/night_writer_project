# require './lib/english_translator.rb'
require 'pry'

braille = File.open(ARGV[0], "r")
braille_text = braille.read
#
# english_translator = EnglishTranslator.new
# english_translation = english_translator.translate(braille_text)
# message.close
#
characters = braille_text.chars
character_count = (characters.count - 1)
puts "Created '#{ARGV[1]}' containing #{character_count} characters."

message = File.open(ARGV[1], "w")
# messge.write(english_translation)

message.close
