require_relative "app.rb"
require "test/unit"

class TestPalindrome < Test::Unit::TestCase
  def test_longest_palindrome
  end
end

class TestBinary < Test::Unit::TestCase
  def test_binary_to_decimal
    assert_equal(0, binary_to_decimal(''))
    assert_equal(1, binary_to_decimal('1'))
    assert_equal(2, binary_to_decimal('10'))
    assert_equal(3, binary_to_decimal('11'))
    assert_equal(4, binary_to_decimal('100'))
    assert_equal(5, binary_to_decimal('101'))
  end
  def test_decimal_to_binary
    assert_equal('0', decimal_to_binary(0))
    assert_equal('1', decimal_to_binary(1))
    assert_equal('10', decimal_to_binary(2))
    assert_equal('11', decimal_to_binary(3))
    assert_equal('100', decimal_to_binary(4))
    assert_equal('101', decimal_to_binary(5))
  end
end

require 'rack/test'

class BountyTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    assert last_response.ok?
    assert_equal 'BOUNTY?', last_response.body
  end

  def test_binary_to_decimal
    get '/binary_to_decimal', binary: '101'
    assert last_response.ok?
    assert_equal '5', last_response.body
  end

  def test_decimal_to_binary
    get '/decimal_to_binary', decimal: '5'
    puts last_response.body
    assert last_response.ok?
    assert_equal '101', last_response.body
  end
end


