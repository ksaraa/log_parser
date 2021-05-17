# frozen_string_literal: true

class Reader
  def initialize(file_path:)
    @file_path = file_path
  end

  def call(&processor)
    File.foreach(file_path) do |file_line|
      processor.call(file_line)
    end
  end

  private

  attr_reader :file_path
end
