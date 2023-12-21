# frozen_string_literal: true

require 'test_helper'
require 'mocha/minitest'
require 'stringio'
require 'CLI/command'

class CommandTest < Minitest::Test
  def test_run_help_flag
    command = CLI::Command.new

    output = capture_output { command.parse(['--help']).run }
    assert_includes output, 'Usage: '
  end

  private

  def capture_output
    output = StringIO.new
    $stdout = output
    yield
    output.string
  ensure
    $stdout = STDOUT
  end
end
