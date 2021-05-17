# frozen_string_literal: true

RSpec.describe Reader do
  let(:file_path) { 'spec/fixtures/files/sample_file.log' }

  subject { described_class.new(file_path: file_path) }

  describe '#call' do
    it 'calls proc for each file line' do
      sample_proc = proc {}

      expect(sample_proc).to receive(:call).with("/sample_path_a 80.150.150.150\n").twice
      expect(sample_proc).to receive(:call).with("/sample_path_a 10.100.100.100\n").once
      expect(sample_proc).to receive(:call).with("/sample_path_b 10.100.100.100\n").twice
      subject.call(&sample_proc)
    end
  end
end
