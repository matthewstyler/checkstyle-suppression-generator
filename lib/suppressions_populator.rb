# frozen_string_literal: true

# Populates a string with the suppression xml, given a list of tokens
class SuppressionsPopulator
  HEADER = <<~HEADER
    <?xml version="1.0"?>
    <!DOCTYPE suppressions PUBLIC "-//Checkstyle//DTD SuppressionFilter Configuration 1.2//EN"
          "https://checkstyle.org/dtds/suppressions_1_2.dtd">

    <suppressions>
  HEADER

  FOOTER = <<~FOOTER
    </suppressions>
  FOOTER

  def initialize(tokens)
    @tokens = tokens
  end

  def populate
    "#{HEADER}\n#{@tokens.map(&:to_suppression).join("\n")}\n\n#{FOOTER}"
  end
end
