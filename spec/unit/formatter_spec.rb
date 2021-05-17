# frozen_string_literal: true

RSpec.describe Formatter do
  describe '#call' do
    let(:analysis) { double(:analysis, title: 'sample title', log_entries: [log_entry]) }
    let(:log_entry) { double(:log_entry, path: '/sample_path', visitor_counter: 1) }

    let(:expected_output) do
      "*** Sample title ***\n"\
      "/sample_path 1 sample title\n\n"
    end

    it 'outputs analysis to stdout' do
      expect { subject.call(analysis: analysis) }.to output(expected_output).to_stdout
    end
  end
end
