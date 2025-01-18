# frozen_string_literal: true

require_relative "hexlet_code/version"

# Main module
module HexletCode
  autoload :Tag, "hexlet_code/tag"
  class Error < StandardError; end
  # Your code goes here...
end
