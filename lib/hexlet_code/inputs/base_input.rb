# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      def initialize(**kwargs)
        @field = kwargs[:field]
        @options = kwargs[:options]
        @entity = kwargs[:entity]
      end

      def process
        [make_label, make_field]
      end

      def make_label
        { tag: :label, options: { for: @field }, inner: @field.to_s.capitalize }
      end
    end
  end
end
