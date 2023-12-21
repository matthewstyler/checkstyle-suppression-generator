# frozen_string_literal: true

require 'checkstyle_output_reader'
require 'checkstyle_output_tokenizer'
require 'suppressions_populator'
require 'suppression_writer'

# Facade that manages the application input and output for suppression generation
class SuppressionGenerator
  def initialize(checkstyle_file_name, suppressions_file_name)
    @checkstyle_file_name = checkstyle_file_name
    @suppressions_file_name = suppressions_file_name
  end

  def generate
    write_suppressions(SuppressionsPopulator.new(tokenize_checkstyle_output(read_checkstyle_file)).populate)
  end

  private

  def write_suppressions(suppression_xml)
    SuppressionWriter.new(@suppressions_file_name, suppression_xml).write
  end

  def read_checkstyle_file
    CheckstyleOutputReader.new(@checkstyle_file_name).read
  end

  def tokenize_checkstyle_output(checkstyle_output)
    CheckstyleOutputTokenizer.new(checkstyle_output).tokenize
  end
end
