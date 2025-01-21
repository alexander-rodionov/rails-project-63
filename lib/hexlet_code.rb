# frozen_string_literal: true

require_relative "hexlet_code/version"

# Main module
PARAM_DEFAULTS = { url: "#", method: "post" }.freeze
PARAM_RENAMES = { url: :action }.freeze

module HexletCode
  autoload :Tag, "hexlet_code/tag"
  autoload :Params, "hexlet_code/params"

  #  строит тэг формы с параметрами из параметрами и содержимым из блока
  def self.form_for(data_obj, **params)
    raise ArgumentError, "No block given to" unless block_given?

    params = convert_params(params)
    inner_tags = (yield Params.new)&.tags || {}
    fields = inner_tags.any? ? convert_fields(inner_tags, data_obj) : ""
    "<form#{params ? " " : ""}#{render_params(params)}>#{fields}</form>"
  end

  # устанавливает для параметров значения по умолчанию и подменяет названия параметров тэга относительно параметров вызова
  def self.convert_params(params)
    keys = (params.keys + PARAM_DEFAULTS.keys).uniq
    res = {}
    keys.each do |key|
      val = params[key] || PARAM_DEFAULTS[key]
      key = PARAM_RENAMES[key] || key
      res[key] = val
    end
    res
  end

  # формирует строковое представление параметров
  def self.render_params(params)
    params.sort.to_h.map { |k, v| "#{k}=\"#{v}\"" }.join " "
  end

  # преобразует полученные параметры (вложенных тэгов) в текст тэга
  def self.convert_fields(tags, obj)
    tags.map do |t|
      tag = t[:tag]
      name = t[:name]
      tag_params = { **t[:params].sort.to_h }
      unless name.nil?
        tag_params.merge! HexletCode.check_against_object name, obj unless name.nil?
        tag_params = { name: name, **tag_params }
      end
      if t.key?(:__put_outer_value)
        value = tag_params.delete(:value) || ""
        Tag.build(tag, **tag_params) { value }
      else
        Tag.build(tag, **tag_params)
      end
    end.join
  end

  # проверяет соответствие полей формы полям в привязанном объекте и возвращает из него значения
  def self.check_against_object(name, obj)
    raise NoMethodError, "Field '#{name}' is not in object '#{obj.class}'" unless obj.respond_to? name

    { value: obj.send(name) }
  end

  class Error < StandardError; end
end
