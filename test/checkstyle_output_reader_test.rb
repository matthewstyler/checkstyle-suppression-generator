# frozen_string_literal: true

require 'test_helper'

class CheckstyleOutputReaderTest < Minitest::Test
  def setup
    @valid_file = 'valid_file.txt'
    @nonexistent_file = 'nonexistent_file.txt'
    @reader = CheckstyleOutputReader.new(@valid_file)
  end

  def test_read_valid_file
    File.expects(:read).with(@valid_file).returns("Contents of #{@valid_file}")

    assert_equal "Contents of #{@valid_file}", @reader.read
  end

  def test_read_nonexistent_file
    File.expects(:read).with(@nonexistent_file).raises(Errno::ENOENT)

    assert_raises(ArgumentError, "File not found: #{@nonexistent_file}") do
      CheckstyleOutputReader.new(@nonexistent_file).read
    end
  end
end
