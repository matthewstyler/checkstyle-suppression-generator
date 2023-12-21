# frozen_string_literal: true

require 'tty/option'
require 'suppression_generator'

module CLI
  # Command line usage for the suppression generator
  class Command
    include TTY::Option

    usage do
      program 'checkstyle-suppression-generator'
      desc 'Generate a Java checkstyle suppressions.xml file from a checkstyle:check output.'
    end

    argument :checkstyle_output do
      name 'checkstyle_output(String)'
      arity one
      desc 'Output from checkstyle:check goal'
    end

    keyword :o do
      default 'suppressions.xml'
      arity one
      desc 'Name of the suppressions file to be generated'
    end

    flag :help do
      short '-h'
      long '--help'
      desc 'Print usage'
    end

    def run
      if params[:help]
        print help
      elsif params.errors.any?
        puts params.errors.summary
      else
        execute_command
      end
    end

    private

    def execute_command
      puts params[:checkstyle_output]
      puts params[:o]
      SuppressionGenerator.new(params[:checkstyle_output], params[:o]).generate
    end
  end
end
