# frozen_string_literal: true

require 'test_helper'

class CheckstyleOutputTokenTest < Minitest::Test
  def test_initialize
    token_data = ['', 'WARNING', 'file.java', 'WhitespaceAround']
    token = CheckstyleOutputToken.new(token_data)

    assert_equal 'WARNING', token.severity
    assert_equal 'file.java', token.file_name
    assert_equal 'WhitespaceAround', token.offense
    assert_equal "\t<suppress checks=\"WhitespaceAround\" files=\"file.java\"/>", token.to_suppression
  end
end
