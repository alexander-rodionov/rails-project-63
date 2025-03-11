# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      def make_field
        { tag: :input,
          options: { name: @field,
                     **@options.except(:type),
                     type: :text,
                     value: @data } }
      end
    end
  end
end
