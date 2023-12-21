# frozen_string_literal: true

# Data bag to capture fields used to generate suppressions from an offending checkstyle output line
class CheckstyleOutputToken
  attr_reader :severity, :file_name, :offense

  OFFENSE_CONVERSION = {
    'noTrailingWhitespace' => 'RegexpSinglelineCheck',
    'noConsecutiveLines' => 'RegexpMultilineCheck',
    'commentFirstSentenceMultiline' => 'RegexpMultilineCheck',
    'commentFirstSentenceSingleline' => 'RegexpSinglelineCheck'
  }.freeze

  def initialize(token_data)
    @severity = token_data[1]
    @file_name = token_data[2]
    @offense = OFFENSE_CONVERSION[token_data[3]] || token_data[3]
  end

  def to_suppression
    "  <suppress checks=\"#{offense}\" files=\"#{file_name}\"/>"
  end
end
