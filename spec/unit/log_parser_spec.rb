# frozen_string_literal: true

RSpec.describe LogParser do
  describe '#call' do
    subject { LogParser.new(argv) }

    context 'success' do
      context 'called with exactly one argument' do
        let(:argv) { ['/log_file_path'] }

        it 'parses logs' do
          expect(subject).to receive(:parse_logs)
          subject.call
        end
      end
    end

    context 'failure' do
      context 'called without arguments' do
        let(:argv) { [] }

        it 'displays usage message' do
          expect { subject.call }.to output(/Usage:/).to_stdout
        end
      end

      context 'with more than one argument' do
        let(:argv) { %w[first_argument second_argument] }

        it 'displays usage message' do
          expect { subject.call }.to output(/Usage:/).to_stdout
        end
      end
    end
  end
end
