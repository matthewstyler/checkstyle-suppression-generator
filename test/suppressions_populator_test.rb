# frozen_string_literal: true

require 'test_helper'

class SuppressionsPopulatorTest < Minitest::Test
  def setup
    @tokens = [
      CheckstyleOutputToken.new(['', 'WARNING', 'file1.java', 'Offense1']),
      CheckstyleOutputToken.new(['', 'ERROR', 'file2.java', 'Offense2']),
      CheckstyleOutputToken.new(['', 'WARNING', 'file3.java', 'Offense3'])
    ]
    @populator = SuppressionsPopulator.new(@tokens)
  end

  def test_populate
    expected_result = <<~EXPECTED_RESULT
      <?xml version="1.0"?>
      <!DOCTYPE suppressions PUBLIC "-//Checkstyle//DTD SuppressionFilter Configuration 1.2//EN"
            "https://checkstyle.org/dtds/suppressions_1_2.dtd">

      <suppressions>

      \t<suppress checks="Offense1" files="file1.java"/>
      \t<suppress checks="Offense2" files="file2.java"/>
      \t<suppress checks="Offense3" files="file3.java"/>

      </suppressions>
    EXPECTED_RESULT

    assert_equal expected_result.strip, @populator.populate.strip
  end

  def test_populate_with_empty_tokens
    populator = SuppressionsPopulator.new([])

    expected_result = <<~EXPECTED_RESULT
      <?xml version="1.0"?>
      <!DOCTYPE suppressions PUBLIC "-//Checkstyle//DTD SuppressionFilter Configuration 1.2//EN"
            "https://checkstyle.org/dtds/suppressions_1_2.dtd">

      <suppressions>



      </suppressions>
    EXPECTED_RESULT

    assert_equal expected_result.strip, populator.populate.strip
  end
end
