# frozen_string_literal: true

# Writes the suppression xml to a given file name
class SuppressionWriter
  def initialize(file_name, suppression_xml)
    @file_name = file_name
    @suppression_xml = suppression_xml
  end

  def write
    File.write(@file_name, @suppression_xml)
  end
end
