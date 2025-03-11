# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      DEFAULT_COLS = '20'
      DEFAULT_ROWS = '40'
      def make_field
        { tag: :textarea,
          options: { name: @field,
                     cols: @options.fetch(:cols, DEFAULT_COLS),
                     rows: @options.fetch(:rows, DEFAULT_ROWS),
                     **@options.except(:as, :cols, :rows) },
          inner: @data }
      end
    end
  end
end
