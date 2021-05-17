# frozen_string_literal: true

module Analysers
  class UniqViewsAnalyser < BaseAnalyser
    private

    def title
      'uniq views'
    end

    def analyse_logs(logs)
      logs.map { |path, ips| LogEntry.new(path, ips.uniq.count) }
    end
  end
end
