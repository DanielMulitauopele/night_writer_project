require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer.rb'

class NightWriterTest < Minitest::Test
  def test_it_exists
    night_writer = NightWriter.new

    assert_instance_of NightWriter, night_writer
  end

  def test_it_can_receive_inputs
    night_writer = NightWriter.new

    # assert_instance_of NightWriter, night_writer
  end
end
