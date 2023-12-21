# frozen_string_literal: true

# Reads the checkstyle:check file
class CheckstyleOutputReader
  def initialize(filename)
    @filename = filename
  end

  def read
    File.read(@filename)
  rescue Errno::ENOENT
    raise ArgumentError, "File not found: #{@filename}"
  end
end
