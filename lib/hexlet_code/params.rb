# class for params

module HexletCode
  class Params
    attr_reader :tags

    def initialize
      @tags = []
    end

    # tag input
    def input(*args, **params)
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
      @tags << { tag: :input, params: { type: :submit, **params, value: args[0] } }
      self
    end
  end
end
