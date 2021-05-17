# frozen_string_literal: true

class Runner
  def initialize(file_path:, reader: nil, processor: nil, analysers: nil, formatter: nil)
    @file_path = file_path
    @reader = reader || Reader
    @processor = processor || Processor.new
    @analysers = analysers || [Analysers::ViewsAnalyser.new, Analysers::UniqViewsAnalyser.new]
    @formatter = formatter || Formatter.new
  end

  def call
    display_analyses(logs)
  end

  private

  attr_reader :file_path, :reader, :processor, :formatter, :analysers

  def logs
    reader.new(file_path: file_path).call do |file_line|
      processor.call(file_line: file_line)
    end

    processor.logs
  end

  def display_analyses(logs)
    analysers.each do |analyser|
      analysis = generate_analysis(analyser, logs)
      display_analysis(analysis)
    end
  end

  def generate_analysis(analyser, logs)
    analyser.generate_analysis(logs: logs)
  end

  def display_analysis(analysis)
    formatter.call(analysis: analysis)
  end
end
