# frozen_string_literal: true

module Analysers
  class ViewsAnalyser < BaseAnalyser
    private

    def title
      'views'
    end

    def analyse_logs(logs)
      logs.map { |path, ips| LogEntry.new(path, ips.count) }
    end
  end
end
