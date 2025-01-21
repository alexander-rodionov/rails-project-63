# frozen_string_literal: true

module HexletCode
  # class for params
  class Params
    attr_reader :tags

    def initialize
      @tags = []
    end

    # tag input
    def input(*args, **params) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
      p "input #{args}, #{params}"
      @tags << { tag: :label, params: { for: args[0], value: args[0].capitalize }, __put_outer_value: true }

      tag_data = { tag: :input, name: args[0], params: params }
      if tag_data[:params].delete(:as) == :text
        tag_data[:tag] = :textarea
        tag_data[:__put_outer_value] = true
        tag_data[:params][:cols] ||= "20"
        tag_data[:params][:rows] ||= "40"
      else
        tag_data[:params][:type] = :text
      end
      @tags << tag_data
      self
    end

    # tab submit
    def submit(*args, **params)
      p "submit #{args}, #{params}"
      @tags << { tag: :input, params: { type: :submit, **params, value: args[0] || "Save" } }
      self
    end
  end
end
