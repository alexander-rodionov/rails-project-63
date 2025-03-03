# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("hexlet_code", __dir__)

module HexletCode
  autoload :VERSION, "version"
  autoload :Tag, "tag"
  autoload :FormBuilder, "form_builder"
  autoload :FormRendererHtml, "form_renderer"

  def self.form_for(entity, **params)
    fb = FormBuilder.new entity, params
    raise ArgumentError unless block_given?

    yield fb
    FormRendererHtml.new(fb.data).to_html
  end

  class Error < StandardError; end
end
