require "minitest/autorun"
require "minitest/pride"
require "./lib/english_translator.rb"
require 'pry'

class EnglishTranslatorTest < Minitest::Test

  def test_it_exists
    english_translator = EnglishTranslator.new

    assert_instance_of EnglishTranslator, english_translator
  end

  def test_it_can_break_braille_into_chunks
    english_translator = EnglishTranslator.new

    expected = ["0.0.0.", "......", "......"]
    actual = english_translator.break_it_up_into_chunks("0.0.0.............")

    assert_equal expected, actual
  end

  def test_it_can_break_strings_into_smaller_strings
    english_translator = EnglishTranslator.new
    chunk_array = english_translator.break_it_up_into_chunks("0.0.0.............")

    expected = ["0.", "0.", "0."]
    actual = english_translator.split_top_into_twos(chunk_array)

    assert_equal expected, actual
  end

  def test_it_can_zip_elements
    english_translator = EnglishTranslator.new

    tops_array = ["0.", "0."]
    mids_array = ["..", ".."]
    bots_array = ["..", ".."]
    expected = [["0.", "..", ".."], ["0.", "..", ".."]]
    actual = english_translator.zip_elements(tops_array, mids_array, bots_array)

    assert_equal expected, actual
  end


  def test_braille_is_converted
    english_translator = EnglishTranslator.new

    expected = ["a", "b"]
    actual = english_translator.convert_to_letters([["0.", "..", ".."], ["0.", "0.", ".."]])

    assert_equal expected, actual
  end

  def test_the_characters_are_joined
    english_translator = EnglishTranslator.new

    expected = "ab"
    actual = english_translator.join_characters(["a", "b"])

    assert_equal expected, actual
  end
end
