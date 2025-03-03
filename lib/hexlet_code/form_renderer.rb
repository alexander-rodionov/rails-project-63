# frozen_string_literal: true

require_relative 'html_mixin'

module HexletCode
  class FormRenderer
    # Renders a form
    def initialize(builder_data)
      @builder_data = builder_data
    end

    def render
      form_data = process @builder_data
      HexletCode::Tag.build('form', form_data[:form_data].sort.to_h) do
        form_data[:fields].map do |f|
          HexletCode::Tag.build(f[:tag], f[:params]) { f[:inner] }
        end.join
      end
    end
  end

  class FormRendererHtml < FormRenderer
    include HTMLMixin

    def to_html
      render
    end

  end
end
