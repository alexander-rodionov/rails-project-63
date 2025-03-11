# frozen_string_literal: true

require 'form_renderer'

DEFAULT_SUBMIT_NAME = 'Save'

module HexletCode
  class FormBuilder
    attr_reader :form_data

    def initialize(entity, options = {})
      action = options.fetch(:url, '#')
      method = options.fetch(:method, 'post')
      @entity = entity
      @form_data = {
        inputs: [],
        submit: { caption: nil, options: nil },
        form_options: { action: action, method: method }.merge(options.except(:url, :method))
      }
    end

    def input(field, **options)
      @form_data[:inputs] << { field: field, options: options, data: @entity.send(field) }
    end

    def submit(caption = DEFAULT_SUBMIT_NAME, **options)
      @form_data[:submit] = { caption: caption, options: options }
    end
  end
end
