# frozen_string_literal: true

RSpec.describe Analysers::ViewsAnalyser do
  describe '#generate_analysis' do
    let(:logs) do
      { '/path_a' => ['80.150.150.150', '80.150.150.150', '90.200.200.200'],
        '/path_b' => ['80.150.150.150'] }
    end

    let(:analysis) { subject.generate_analysis(logs: logs) }

    it 'returns analysis with correct title' do
      expect(analysis).to have_attributes(title: 'views')
    end

    it 'returns analysis with correct log entries' do
      expect(analysis.log_entries).to contain_exactly(an_object_having_attributes(path: '/path_a', visitor_counter: 3),
                                                      an_object_having_attributes(path: '/path_b', visitor_counter: 1))
    end
  end
end
