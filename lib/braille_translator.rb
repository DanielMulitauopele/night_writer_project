class BrailleTranslator
  def initialize
    @alpha_to_braille = {
      "a" => ["0.", "..", ".."],
      "b" => ["0.", "0.", ".."],
      "c" => ["00", "..", ".."],
      "d" => ["00", ".0", ".."],
      "e" => ["0.", ".0", ".."],
      "f" => ["00", "0.", ".."],
      "g" => ["00", "00", ".."],
      "h" => ["0.", "00", ".."],
      "i" => [".0", "0.", ".."],
      "j" => [".0", "00", ".."],
      "k" => ["0.", "..", "0."],
      "l" => ["0.", "0.", "0."],
      "m" => ["00", "..", "0."],
      "n" => ["00", ".0", "0."],
      "o" => ["0.", ".0", "0."],
      "p" => ["00", "0.", "0."],
      "q" => ["00", "00", "0."],
      "r" => ["0.", "00", "0."],
      "s" => [".0", "0.", "0."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "..", "00"],
      "v" => ["0.", "0.", "00"],
      "w" => [".0", "00", ".0"],
      "x" => ["00", "..", "00"],
      "y" => ["00", ".0", "00"],
      "z" => ["0.", ".0", "00"],
      "!" => ["..", "00", "0."],
      "'" => ["..", "..", "0."],
      "," => ["..", "0.", ".."],
      "-" => ["..", "..", "00"],
      "." => ["..", "00", ".0"],
      "?" => ["..", "0.", "00"],
      "cap" => ["..", "..", ".0"],
      "#" => [".0", ".0", "00"],
      "0" => [".0", "00", ".."],
      "1" => ["0.", "..", ".."],
      "2" => ["0.", "0.", ".."],
      "3" => ["00", "..", ".."],
      "4" => ["00", ".0", ".."],
      "5" => ["0.", ".0", ".."],
      "6" => ["00", "0.", ".."],
      "7" => ["00", "00", ".."],
      "8" => ["0.", "00", ".."],
      "9" => [".0", "0.", ".."],
      " " => ["..", "..", ".."]
      }
  end

  def translate(input)
    input_array = input.chars
    braille_letters = input_array.map do |element|
      # binding.pry
      element = element.downcase
      @alpha_to_braille[element]
    end

    # scan(/(.{80})/)

    braille_letters_nilless = braille_letters.compact
    organized_braille = braille_letters_nilless.transpose

    final_array = []
    top = organized_braille[0].join
    mid = organized_braille[1].join
    bot = organized_braille[2].join

    top_array = top.scan(/.{1,80}/)
    mid_array = mid.scan(/.{1,80}/)
    bot_array = bot.scan(/.{1,80}/)

    final_array << top_array
    final_array << mid_array
    final_array << bot_array
    # binding.pry


    # final_final = final_array.each_index do |index|
    #   final_array[index][0]
    #   final_array[index][1]
    #   final_array[index][2]


    final_array
    # final = "#{organized_braille[0].join}\n" + "#{organized_braille[1].join}\n" + "#{organized_braille[2].join}"
    # x = final.scan(/.{1,80}/)
    # y = x.each_slice(3).map {|slice| slice}

  end
end
