# frozen_string_literal: true

require 'test_helper'

class SuppressionGeneratorTest < Minitest::Test
  def setup
    @checkstyle_file_name = 'checkstyle_input.xml'
    @suppressions_file_name = 'suppressions_output.xml'
    @generator = SuppressionGenerator.new(@checkstyle_file_name, @suppressions_file_name)
  end

  def test_generate
    expected_checkstyle_content = <<~CHECKSTYLE_OUTPUT
      a non matching line
      [WARNING] src/main/java/com/test/DEF.java:[147,4] (coding) OverloadMethodsDeclarationOrder: All overloaded methods should be placed next to each other. Placing non-overloaded methods in between overloaded methods with the same type is a violation. Previous overloaded method located at line '119'.
      [WARNING] src/main/java/com/test/ABC.java:[26,11] (sizes) ParameterNumber: More than 7 parameters (found 9).
      [WARNING] src/main/java/com/test/ABC.java:[103,4] (coding) ReturnCount: Return count is 6 (max allowed for non-void methods/lambdas is 4).
      [WARNING] src/main/java/com/test/ABC.java:[103,4] (metrics) NPathComplexity: NPath Complexity is 720 (max allowed is 200).
    CHECKSTYLE_OUTPUT
    CheckstyleOutputReader.any_instance.expects(:read).returns(expected_checkstyle_content)

    expected_result =
      "<?xml version=\"1.0\"?>\n<!DOCTYPE suppressions PUBLIC \"-//Checkstyle//DTD SuppressionFilter" \
      " Configuration 1.2//EN\"\n      \"https://checkstyle.org/dtds/suppressions_1_2.dtd\">\n\n<suppressions>\n\n\t" \
      "<suppress checks=\"OverloadMethodsDeclarationOrder\" files=\"src/main/java/com/test/DEF.java\"/>\n\t<suppress" \
      " checks=\"ParameterNumber\" files=\"src/main/java/com/test/ABC.java\"/>\n\t<suppress checks=\"ReturnCount\" " \
      "files=\"src/main/java/com/test/ABC.java\"/>\n\t<suppress checks=\"NPathComplexity\" files=\"src/main/java/com" \
      "/test/ABC.java\"/>\n\n</suppressions>\n"
    File.expects(:write).with(@suppressions_file_name, expected_result)

    @generator.generate
  end
end
