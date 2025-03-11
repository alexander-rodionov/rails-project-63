# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      def initialize(**kwargs)
        @field = kwargs[:field]
        @options = kwargs[:options]
        @data = kwargs[:data]
        raise(NotImplementedError, 'Cannot instantiate the abstract base class') if self.class == BaseInput # rubocop:disable Style/ClassEqualityComparison
      end

      def process
        [make_label, make_field]
      end

      def make_label
        { tag: :label, options: { for: @field }, inner: @field.to_s.capitalize }
      end

      def self.input_class_factory(**kwargs)
        input_type = kwargs.dig(:options, :as) || :string
        class_name = "#{input_type.capitalize}Input"
        klass = HexletCode::Inputs.const_get(class_name)
        raise(NotImplementedError("Input type #{input_type} not implemented")) unless klass.is_a?(Class)

        klass.new(**kwargs)
      end
    end
  end
end
