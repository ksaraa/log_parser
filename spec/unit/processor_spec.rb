# frozen_string_literal: true

RSpec.describe Processor do
  describe '#call' do
    let(:file_lines) do
      ['/path_a 80.150.150.150',
       '/path_a 80.150.150.150',
       '/path_b 80.150.150.150',
       '/path_a 90.200.200.200']
    end

    let(:expected_logs) do
      { '/path_a' => ['80.150.150.150', '80.150.150.150', '90.200.200.200'],
        '/path_b' => ['80.150.150.150'] }
    end

    it 'processes provided file line' do
      expect do
        file_lines.each { |file_line| subject.call(file_line: file_line) }
      end.to change { subject.logs }.from({}).to(expected_logs)
    end
  end
end
