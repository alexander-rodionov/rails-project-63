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

    # def process_html
    #   params = @builder_data[:form_params].clone
    #   form_data = { form_data: { action: (params.delete(:url) or '#'), method: (params.delete(:method) or 'post') } }
    #   form_data[:form_data] = form_data[:form_data].merge(params)
    #   form_data[:fields] = []
    #   @builder_data[:inputs].each do |i|
    #     input_html form_data, i[:field], i[:params]
    #   end
    #   @builder_data[:submits].each do |s|
    #     submit_html form_data, s[:caption], s[:params]
    #   end
    #   form_data
    # end

    # def input_html(form_data, field, params)
    #   params = params.clone
    #   entity = @builder_data[:entity]
    #   form_data[:fields] << { tag: :label, params: { for: field }, inner: field.to_s.capitalize }
    #   form_data[:fields] << if params.delete(:as) == :text
    #                           { tag: :textarea, params: { name: field,
    #                                                       cols: params.delete(:cols) || "20",
    #                                                       rows: params.delete(:rows) || "40",
    #                                                       **(params || {}) }, inner: entity.send(field) }
    #                         else
    #                           { tag: :input,
    #                             params: { name: field, **(params || {}),
    #                                       type: params.delete(:type) || :text,
    #                                       value: entity.send(field) } }
    #                         end
    # end

    # def submit_html(form_data, caption, params)
    #   form_data[:fields] << { tag: :input, params: { **params, type: :submit, value: caption } }
    # end
  end
end
