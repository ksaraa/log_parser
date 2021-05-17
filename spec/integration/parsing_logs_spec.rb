# frozen_string_literal: true

RSpec.describe 'Parsing logs' do
  subject { LogParser.new(argv).call }

  context 'script run correctly' do
    let(:argv) { ['spec/fixtures/files/sample_file.log'] }

    let(:expected_output) do
      "*** Views ***\n"\
      "/sample_path_a 3 views\n"\
      "/sample_path_b 2 views\n\n"\
      "*** Uniq views ***\n"\
      "/sample_path_a 2 uniq views\n"\
      "/sample_path_b 1 uniq views\n\n"\
    end

    it 'displays logs analysis' do
      expect { subject }.to output(expected_output).to_stdout
    end
  end

  context 'script run incorrectly' do
    let(:argv) { [] }

    it 'displays usage message' do
      expect { subject }.to output(/Usage:/).to_stdout
    end
  end
end
