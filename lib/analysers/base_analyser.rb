# frozen_string_literal: true

module Analysers
  class BaseAnalyser
    def initialize(sorter: Sorter.new)
      @sorter = sorter
    end

    def generate_analysis(logs:)
      Analysis.new(title, log_entries(logs))
    end

    private

    attr_accessor :sorter

    def log_entries(logs)
      log_entries = analyse_logs(logs)
      sorter.call(items: log_entries, sort_key: :visitor_counter)
    end

    def title
      raise 'Called abstract method: title'
    end

    def analyse_data(_data)
      raise 'Called abstract method analyse_data'
    end
  end
end
