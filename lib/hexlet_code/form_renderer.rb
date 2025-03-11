# frozen_string_literal: true

module HexletCode
  class FormRenderer
    def initialize(builder_data)
      @builder_data = builder_data
    end

    def render
      process_form
      HexletCode::Tag.build('form', @form_processed[:form].sort.to_h) do
        @form_processed[:fields].map do |f|
          HexletCode::Tag.build(f[:tag], f[:options]) { f[:inner] }
        end.join
      end
    end

    def process_form
      @form_processed = { form: @builder_data[:form_options], fields: [] }
      @builder_data[:inputs].each do |i|
        input_html(**i) # i[:field], i[:options])
      end
      submit_html(@builder_data[:submit][:caption], @builder_data[:submit][:options]) if submit_defined?
      @form_processed
    end

    def input_html(input_data)
      @form_processed[:fields].concat(HexletCode::Inputs::BaseInput.input_class_factory(**input_data).process)
    end

    def submit_html(caption, options)
      @form_processed[:fields] << { tag: :input, options: { **options, type: :submit, value: caption } }
    end

    def submit_defined?
      !@builder_data[:submit][:caption].nil?
    end
  end
end
