require_relative "number_decoder.rb"
require "test/unit"

class TestNumberDecoder < Test::Unit::TestCase
  def test_simple
  number_decoder = NumberDecoder.new
  number_decoder.user_input("6686787825")
  number_decoder.number_to_words  
  assert_equal(number_decoder.result,[["motor", "truck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], ["noun", "struck"], ["onto", "struck"], "motortruck"])
  
  number_decoder = NumberDecoder.new
  number_decoder.user_input("2282668687")
  number_decoder.number_to_words 
  assert_equal(number_decoder.result,[["act", "amounts"], ["act", "contour"], ["bat", "amounts"], ["bat", "contour"], ["cat", "amounts"], ["cat", "contour"], ["acta", "mounts"], "catamounts"])
  
  number_decoder = NumberDecoder.new
  number_decoder.user_input("2222738275")
  number_decoder.number_to_words
  assert_equal(number_decoder.result,[["cabaret", "ark"], ["cabaret", "ask"]])
  
  number_decoder = NumberDecoder.new
  number_decoder.user_input("2282668625")
  number_decoder.number_to_words
  assert_equal(number_decoder.result,[["acta", "nounal"]])
  end
end