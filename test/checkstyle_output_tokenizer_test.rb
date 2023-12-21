# frozen_string_literal: true

require 'test_helper'

class CheckstyleOutputTokenizerTest < Minitest::Test
  def setup
    @checkstyle_output = <<~CHECKSTYLE_OUTPUT
      a non matching line
      [WARNING] ssrc/main/java/com/test/DEF.java:[147,4] (coding) OverloadMethodsDeclarationOrder: All overloaded methods should be placed next to each other. Placing non-overloaded methods in between overloaded methods with the same type is a violation. Previous overloaded method located at line '119'.
      [WARNING] src/main/java/com/test/ABC.java:[26,11] (sizes) ParameterNumber: More than 7 parameters (found 9).
      [WARNING] src/main/java/com/test/ABC.java:[103,4] (coding) ReturnCount: Return count is 6 (max allowed for non-void methods/lambdas is 4).
      [WARNING] src/main/java/com/test/ABC.java:[103,4] (metrics) NPathComplexity: NPath Complexity is 720 (max allowed is 200).
    CHECKSTYLE_OUTPUT

    @tokenizer = CheckstyleOutputTokenizer.new(@checkstyle_output)
  end

  def test_tokenize
    tokens = @tokenizer.tokenize

    assert_equal 4, tokens.length

    assert_equal 'WARNING', tokens[0].severity
    assert_equal 'ssrc/main/java/com/test/DEF.java', tokens[0].file_name
    assert_equal 'OverloadMethodsDeclarationOrder', tokens[0].offense

    assert_equal 'WARNING', tokens[1].severity
    assert_equal 'src/main/java/com/test/ABC.java', tokens[1].file_name
    assert_equal 'ParameterNumber', tokens[1].offense

    assert_equal 'WARNING', tokens[2].severity
    assert_equal 'src/main/java/com/test/ABC.java', tokens[2].file_name
    assert_equal 'ReturnCount', tokens[2].offense

    assert_equal 'WARNING', tokens[3].severity
    assert_equal 'src/main/java/com/test/ABC.java', tokens[3].file_name
    assert_equal 'NPathComplexity', tokens[3].offense
  end
end
