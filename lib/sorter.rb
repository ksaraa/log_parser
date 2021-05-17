# frozen_string_literal: true

class Sorter
  def initialize(sort_direction: :desc)
    @sort_direction = sort_direction
  end

  def call(items:, sort_key:)
    sorted = items.sort_by(&sort_key)
    sort_direction == :desc ? sorted.reverse : sorted
  end

  private

  attr_reader :sort_direction
end
