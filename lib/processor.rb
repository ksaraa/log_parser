# frozen_string_literal: true

class Processor
  attr_reader :logs

  def initialize
    @logs = Hash.new { [] }
  end

  def call(file_line:)
    path, ip = file_line.split(' ')
    logs[path] <<= ip
  end
end
