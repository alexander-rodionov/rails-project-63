# frozen_string_literal: true

module HexletCode
  SKIP_LAST_CLOSING = %i[br img input].freeze
  class Tag
    def self.build(tag_name, params = {})
      attributes = params.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
      if block_given? && (content = yield)
        "<#{tag_name} #{attributes}".strip + ">#{content}</#{tag_name}>"
      else
        "<#{tag_name} #{attributes} ".strip + closing(tag_name)
      end
    end

    def self.closing(tag_name)
      if SKIP_LAST_CLOSING.include?(tag_name)
        '>'
      else
        "></#{tag_name}>"
      end
    end
    private_class_method :closing
  end
end
