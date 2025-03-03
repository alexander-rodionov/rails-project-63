# frozen_string_literal: true

module HTMLMixin
  # extension for form renderer to process html forms
  def process(builder_data)
    params = builder_data[:form_params].clone
    form_data = make_form_data params
    builder_data[:inputs].each do |i|
      input_html builder_data, form_data, i[:field], i[:params]
    end
    builder_data[:submits].each do |s|
      submit_html builder_data, form_data, s[:caption], s[:params]
    end
    form_data
  end

  def make_form_data(params)
    form_data = { form_data: { action: (params.delete(:url) or '#'), method: (params.delete(:method) or 'post') } }
    form_data[:form_data] = form_data[:form_data].merge(params)
    form_data[:fields] = []
    form_data
  end

  def input_html(builder_data, form_data, field, params)
    params = params.clone
    entity = builder_data[:entity]
    form_data[:fields] << { tag: :label, params: { for: field }, inner: field.to_s.capitalize }
    form_data[:fields] << if params.delete(:as) == :text
                            { tag: :textarea, params: { name: field,
                                                        cols: params.delete(:cols) || '20',
                                                        rows: params.delete(:rows) || '40',
                                                        **(params || {}) }, inner: entity.send(field) }
                          else
                            { tag: :input,
                              params: { name: field, **(params || {}),
                                        type: params.delete(:type) || :text,
                                        value: entity.send(field) } }
                          end
  end

  def submit_html(_builder_data, form_data, caption, params)
    form_data[:fields] << { tag: :input, params: { **params, type: :submit, value: caption } }
  end
end
