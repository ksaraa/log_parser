# frozen_string_literal: true

RSpec.describe Runner do
  let(:file_path) { '/sample_path' }
  let(:reader_class) { class_double(Reader) }
  let(:reader) { instance_double(Reader) }
  let(:processor) { instance_double(Processor) }
  let(:analysers) { [instance_double(Analysers::ViewsAnalyser), instance_double(Analysers::UniqViewsAnalyser)] }
  let(:formatter) { instance_double(Formatter) }
  let(:file_line) { '/sample_path 80.150.150.150' }
  let(:proccessed_data) { { '/sample_path': ['80.150.150.150'] } }
  let(:analysis) { double('analysis') }

  subject do
    described_class.new(file_path: file_path,
                        reader: reader_class,
                        processor: processor,
                        analysers: analysers,
                        formatter: formatter)
  end

  describe '#call' do
    it 'sends messages to other services' do
      expect(reader_class).to receive(:new).with(file_path: file_path).and_return(reader).once
      expect(reader).to receive(:call).and_return(file_line).once
      expect(processor).to receive(:logs).and_return(proccessed_data).once

      analysers.each do |analyser|
        expect(analyser).to receive(:generate_analysis).with(logs: proccessed_data).and_return(analysis).once
      end

      expect(formatter).to receive(:call).with(analysis: analysis).twice
      subject.call
    end
  end
end
