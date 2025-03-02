# frozen_string_literal: true

class FormBuilder
  attr_reader :data

  def initialize(entity, params = {})
    @data = { entity: entity,
              form_params: params,
              inputs: [],
              submits: [] }
  end

  def input field, **params
    @data[:inputs] << { field: field, params: params }
  end

  def submit caption="Submit", **params
    @data[:submits] << { caption: caption, params: params }
  end
end
