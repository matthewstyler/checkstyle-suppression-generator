# frozen_string_literal: true

# Data bag to capture fields used to generate suppressions from an offending checkstyle output line
class CheckstyleOutputToken
  attr_reader :severity, :file_name, :offense

  def initialize(token_data)
    @severity = token_data[1]
    @file_name = token_data[2]
    @offense = token_data[3]
  end

  def to_suppression
    "\t<suppress checks=\"#{offense}\" files=\"#{file_name}\"/>"
  end
end
