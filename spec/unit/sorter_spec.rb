# frozen_string_literal: true

RSpec.describe Sorter do
  describe '#call' do
    let(:item_a) { double(:item_a, attribute: 1) }
    let(:item_b) { double(:item_b, attribute: 3) }
    let(:item_c) { double(:item_c, attribute: 2) }

    let(:items) {  [item_a, item_b, item_c] }
    let(:sort_key) { :attribute }

    context 'with default sort direction' do
      let(:expected_order) { [item_b, item_c, item_a] }

      it 'sorts items in descending order' do
        sorted_items = subject.call(items: items, sort_key: sort_key)
        expect(sorted_items).to eq(expected_order)
      end
    end

    context 'with :asc sort direction' do
      let(:expected_order) { [item_a, item_c, item_b] }

      subject { described_class.new(sort_direction: :asc) }

      it 'sorts items in ascending order' do
        sorted_items = subject.call(items: items, sort_key: sort_key)
        expect(sorted_items).to eq(expected_order)
      end
    end
  end
end
