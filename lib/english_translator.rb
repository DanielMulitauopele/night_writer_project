require 'pry'
class EnglishTranslator
  attr_reader :braille_to_alpha

  def initialize
    @braille_to_alpha = {
      ["0.", "..", ".."] => "a",
      ["0.", "0.", ".."] => "b",
      ["00", "..", ".."] => "c",
      ["00", ".0", ".."] => "d",
      ["0.", ".0", ".."] => "e",
      ["00", "0.", ".."] => "f",
      ["00", "00", ".."] => "g",
      ["0.", "00", ".."] => "h",
      [".0", "0.", ".."] => "i",
      [".0", "00", ".."] => "j",
      ["0.", "..", "0."] => "k",
      ["0.", "0.", "0."] => "l",
      ["00", "..", "0."] => "m",
      ["00", ".0", "0."] => "n",
      ["0.", ".0", "0."] => "o",
      ["00", "0.", "0."] => "p",
      ["00", "00", "0."] => "q",
      ["0.", "00", "0."] => "r",
      [".0", "0.", "0."] => "s",
      [".0", "00", "0."] => "t",
      ["0.", "..", "00"] => "u",
      ["0.", "0.", "00"] => "v",
      [".0", "00", ".0"] => "w",
      ["00", "..", "00"] => "x",
      ["00", ".0", "00"] => "y",
      ["0.", ".0", "00"] => "z",
      ["..", "00", "0."] => "!",
      ["..", "..", "0."] => "'",
      ["..", "0.", ".."] => ",",
      ["..", "..", "00"] => "-",
      ["..", "00", ".0"] => ".",
      ["..", "0.", "00"] => "?",
      ["..", "..", ".0"] => "cap",
      [".0", ".0", "00"] => "#",
      ["..", "..", ".."] => " ",
      ["0.", "..", ".."] => "1",
      ["0.", "0.", ".."] => "2",
      ["00", "..", ".."] => "3",
      ["00", ".0", ".."] => "4",
      ["0.", ".0", ".."] => "5",
      ["00", "0.", ".."] => "6",
      ["00", "00", ".."] => "7",
      ["0.", "00", ".."] => "8",
      [".0", "0.", ".."] => "9",
      [".0", "00", ".."] => "0"
      }
  end

  def translate(braille_message)
    chunk_array = break_it_up_into_chunks(braille_message)
    tops_array = split_top_into_twos(chunk_array)
    mids_array = split_mid_into_twos(chunk_array)
    bots_array = split_bot_into_twos(chunk_array)
    braille_keys = zip_elements(tops_array, mids_array, bots_array)
    converted = convert_to_letters(braille_keys)
    join_characters(converted)
  end

  def break_it_up_into_chunks(braille_message)
    length = braille_message.length / 3
    braille_message.scan(/.{1,#{length}}/)
  end

  def split_top_into_twos(chunk_array)
    chunk_array[0].scan(/.{1,2}/)
  end

  def split_mid_into_twos(chunk_array)
    chunk_array[0].scan(/.{1,2}/)
  end

  def split_bot_into_twos(chunk_array)
    chunk_array[0].scan(/.{1,2}/)
  end

  def zip_elements(tops_array, mids_array, bots_array)
    tops_array.zip(mids_array, bots_array)
  end

  def convert_to_letters(braille_keys)
    braille_keys.map do |key|
      @braille_to_alpha[key]
    end
  end

  def join_characters(converted)
    converted.join
  end
end
