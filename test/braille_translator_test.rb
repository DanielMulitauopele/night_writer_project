require './lib/braille_translator.rb'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class BrailleTranslatorTest < Minitest::Test

def test_it_exists
  braille_translator = BrailleTranslator.new

  assert_instance_of BrailleTranslator, braille_translator
end

def test_it_turns_input_into_chars
  braille_translator = BrailleTranslator.new
  expected = ["c", "a", "t"]
  actual = braille_translator.turns_input_into_chars("cat")

  assert_equal expected, actual
end

def test_it_can_convert_one_letter
  braille_translator = BrailleTranslator.new
  input_array = braille_translator.turns_input_into_chars("a")
  expected = [["0.", "..", ".."]]
  actual = braille_translator.convert_chars_into_braille(input_array)

  assert_equal expected, actual
end

def test_it_can_convert_more_than_one_letter
  braille_translator = BrailleTranslator.new
  input_array = braille_translator.turns_input_into_chars("ab")
  expected = [["0.", "..", ".."], ["0.", "0.", ".."]]
  actual = braille_translator.convert_chars_into_braille(input_array)

  assert_equal expected, actual
end

def test_it_deletes_nil_from_array
  braille_translator = BrailleTranslator.new
  input_array = braille_translator.turns_input_into_chars("ab")
  braille_letters = braille_translator.convert_chars_into_braille(input_array)
  expected = [["0.", "..", ".."], ["0.", "0.", ".."]]
  actual = braille_translator.deletes_nil_from_array(braille_letters)

  assert_equal expected, actual
end

def test_it_can_transpose_one_letter
  braille_translator = BrailleTranslator.new
  input_array = braille_translator.turns_input_into_chars("a")
  braille_letters = braille_translator.convert_chars_into_braille(input_array)
  braille_letters_nilless = braille_translator.deletes_nil_from_array(braille_letters)
  expected = [["0."], [".."], [".."]]
  actual = braille_letters_nilless.transpose

  assert_equal expected, actual
end

def test_it_can_transpose_more_than_one_letter
  braille_translator = BrailleTranslator.new
  input_array = braille_translator.turns_input_into_chars("ab")
  braille_letters = braille_translator.convert_chars_into_braille(input_array)
  braille_letters_nilless = braille_translator.deletes_nil_from_array(braille_letters)
  expected = [["0.", "0."], ["..", "0."], ["..", ".."]]
  actual = braille_letters_nilless.transpose

  assert_equal expected, actual
end

def test_it_can_translate_one_letter
  braille_translator = BrailleTranslator.new
  expected = [["0."], [".."], [".."]]
  actual = braille_translator.translate("a")

  assert_equal expected, actual
end

def test_it_can_translate_a_word
  braille_translator = BrailleTranslator.new
  expected = [["0.0.0.0.0."], ["00.00.0..0"], ["....0.0.0."]]
  actual = braille_translator.translate("hello")

  assert_equal expected, actual
end

end
