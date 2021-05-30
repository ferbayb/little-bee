require "test/unit"
require_relative "../methods/prompts"

class Test_ordering < Test::Unit::TestCase
  def test_ordering
    test = ["Z", "A"]
    assert_equal("A", sort(test)[0])
  end

  def test_num_ordering
    test = [3, 8, 7, 12, 5]
    assert_equal(12, sort(test)[4])
  end
end