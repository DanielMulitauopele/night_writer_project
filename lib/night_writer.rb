require './lib/braille_translator.rb'
require 'pry'

  message = File.open(ARGV[0], "r")
  message_text = message.read

  braille_translator = BrailleTranslator.new
  braille_translation = braille_translator.translate(message_text)
  message.close

  characters = message_text.chars
  character_count = (characters.count - 1)
  puts "Created '#{ARGV[1]}' containing #{character_count} characters."

  braille = File.open(ARGV[1], "w")
  braille_translation[0].each_index do |string|
    braille.write(braille_translation[0][string] <<"\n")
    braille.write(braille_translation[1][string] <<"\n")
    braille.write(braille_translation[2][string] <<"\n")
  end

braille.close
