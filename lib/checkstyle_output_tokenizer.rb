# frozen_string_literal: true

require 'checkstyle_output_token'

# Tokenizes each line of a given output string
class CheckstyleOutputTokenizer
  PATTERN = /\[(\w+)\]\s+(\S+\.java)(?:.*\)).(\w+):/.freeze

  def initialize(checkstyle_output)
    @checkstyle_output = checkstyle_output
  end

  def tokenize
    @tokenize ||= @checkstyle_output.each_line.map do |line|
      token_data = PATTERN.match(line)
      CheckstyleOutputToken.new(token_data) if token_data
    end.compact
  end
end
