# frozen_string_literal: true

module HexletCode
  # html tag class
  class Tag
    SINGLE_TAGS = %i[area base br col embed hr img input link meta param source track].freeze
    def self.build(tag, **params)
      is_single = SINGLE_TAGS.include? tag

      content = block_given? ? yield : ''

      params.filter! { |x| !x.start_with? '__' }
      res = "<#{tag}"
      res += params.any? ? (params.map { |k, v| " #{k}=\"#{v}\"" }).join : ''
      res + (is_single ? '>' : ">#{content}</#{tag}>")
    end
  end
end
