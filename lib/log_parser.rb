# frozen_string_literal: true

require 'pry'

require_relative 'analysers/base_analyser'
require_relative 'analysers/uniq_views_analyser'
require_relative 'analysers/views_analyser'
require_relative 'analysis'
require_relative 'formatter'
require_relative 'log_entry'
require_relative 'processor'
require_relative 'reader'
require_relative 'runner'
require_relative 'sorter'

class LogParser
  def initialize(argv)
    @argv = argv
  end

  def call
    argv.size == 1 ? parse_logs : usage_info
  end

  private

  attr_reader :argv

  def parse_logs
    Runner.new(file_path: log_file_path).call
  end

  def usage_info
    puts 'Usage: bin/parse log_file_path'
  end

  def log_file_path
    argv[0]
  end
end
