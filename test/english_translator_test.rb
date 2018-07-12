require "minitest/autorun"
require "minitest/pride"
require "./lib/english_translator.rb"

class EnglishTranslatorTest < Minitest::Test

  def test_it_exists
    english_translator = EnglishTranslator.new

    assert_instance_of EnglishTranslator, english_translator
  end

  def test_it_can_break_braille_into_chunks
    english_translator = EnglishTranslator.new

    assert_equal ""
  end

  def test_it_can_break_strings_into_smaller_strings
    english_translator = EnglishTranslator.new

    assert_equal ""
  end

  def test_it_can_zip_elements
    english_translator = EnglishTranslator.new

    assert_equal ""
  end

  def test_elements_are_in_braille
    english_translator = EnglishTranslator.new

    assert_equal ""
  end

  def test_braille_is_converted
    english_translator = EnglishTranslator.new

    assert_equal ""
  end

  def test_the_characters_are_joined
    english_translator = EnglishTranslator.new

    assert_equal ""
  end

end
