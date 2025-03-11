# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))
require 'hexlet_code'
require 'minitest/autorun'

FIXTURES_DIR = 'test/fixtures'

def load_expected(method_name)
  File.read("#{FIXTURES_DIR}/#{method_name}.yml")
end
