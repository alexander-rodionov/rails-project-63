# frozen_string_literal: true

class FormBuilder
  attr_reader :data

  def initialize(entity, params = {})
    @data = { entity: entity,
              form_params: params,
              inputs: [],
              submits: [] }
  end

  def input(field, **params)
    if params.fetch(:type, nil) == :submit
      caption = params.delete(:value) || 'Submit'
      @data[:submits] << { caption: caption, params: params }
    else
      @data[:inputs] << { field: field, params: params }
    end
  end

  def submit(caption = 'Save', **params)
    @data[:submits] << { caption: caption, params: params }
  end
end
