# frozen_string_literal: true

require_relative "hexlet_code/version"

# Main module
module HexletCode
  autoload :Tag, "hexlet_code/tag"

  def self.form_for(_, **params)
    inner_params = ["action=\"#{params.fetch(:url, "#")}\""]
    params.delete(:url)
    inner_params << "method=\"#{params.fetch(:method, "post")}\""
    params.delete(:method)
    inner_params = [*inner_params, *params.map { |k, v| "#{k.to_s.gsub("_", "-")}=\"#{v}\"" }]
    res = "<form #{inner_params.join(" ")}></form>"
    yield res
  end

  class Error < StandardError; end
  # Your code goes here...
end
