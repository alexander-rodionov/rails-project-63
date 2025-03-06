# frozen_string_literal: true

DEFAULT_COLS = '20'
DEFAULT_ROWS = '40'

module HexletCode
  module Inputs
    class TextInput < BaseInput
      def make_field
        { tag: :textarea,
          options: { name: @field,
                     cols: @options.fetch(:cols, DEFAULT_COLS),
                     rows: @options.fetch(:rows, DEFAULT_ROWS),
                     **@options.except(:as, :cols, :rows) },
          inner: @entity.send(@field) }
      end
    end
  end
end
