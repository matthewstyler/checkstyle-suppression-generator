# frozen_string_literal: true

require 'test_helper'

class SuppressionWriterTest < Minitest::Test
  def setup
    @file_name = 'test_suppression.xml'
    @suppression_xml = <<~SUPPRESSION_XML
      <?xml version="1.0"?>
      <suppressions>
        <suppress checks="Offense1" files="file1.java"/>
        <suppress checks="Offense2" files="file2.java"/>
      </suppressions>
    SUPPRESSION_XML

    @writer = SuppressionWriter.new(@file_name, @suppression_xml)
  end

  def test_write
    File.expects(:write).with(@file_name, @suppression_xml)

    @writer.write
  end
end
