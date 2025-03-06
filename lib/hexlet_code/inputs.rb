# frozen_string_literal: true

module HexletCode
  module Inputs
    autoload(:BaseInput, 'hexlet_code/inputs/base_input')
    autoload(:StringInput, 'hexlet_code/inputs/string_input.rb')
    autoload(:TextInput, 'hexlet_code/inputs/text_input.rb')

    def self.input_class_factory(**kwargs)
      input_type = kwargs.dig(:options, :as) || :string
      case input_type
      when :string
        StringInput.new(**kwargs)
      when :text
        TextInput.new(**kwargs)
      else
        raise(NotImplementedError("Input type #{input_type} not implemented"))
      end
    end
  end
end
