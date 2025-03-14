# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path('hexlet_code', __dir__))

module HexletCode
  autoload(:VERSION, 'hexlet_code/version')
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:Inputs, 'hexlet_code/inputs')
  autoload(:FormRenderer, 'hexlet_code/form_renderer')
  autoload(:FormBuilder, 'hexlet_code/form_builder')

  def self.form_for(entity, **params)
    form_builder = FormBuilder.new(entity, params)
    yield(form_builder) if block_given?
    FormRenderer.new(form_builder.form_data).render
  end

  class Error < StandardError; end
end
