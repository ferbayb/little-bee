require "test/unit"
require "date"
require_relative "../methods/age"

class Test_age < Test::Unit::TestCase

  def test_age_y
    assert_equal(21, calc_age("2000-01-01")[:year].to_i)
  end

  def test_age_m
    assert_equal(4, calc_age("2000-01-01")[:month].to_i)
  end

  def test_age_d
    assert_equal(1, calc_age("2000-01-01")[:day].to_i)
  end

end