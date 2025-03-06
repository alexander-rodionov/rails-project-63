# frozen_string_literal: true

require 'form_renderer'

DEFAULT_SUBMIT_NAME = 'Save'

module HexletCode
  class FormBuilder
    # attr_reader :data

    def initialize(entity, options = {})
      action = options.fetch(:url, '#')
      method = options.fetch(:method, 'post')

      # Как будто бы, чем создавать ненужную зависимость между классами, передавая один в другой,
      # лучше таскать между ними структуру данных. Поэтому entity сюда тоже прикопаем.
      #
      @form_body = {
        entity: entity,
        inputs: [],
        submit: { caption: nil, options: nil },
        form_options: { action: action, method: method }.merge(options.except(:url, :method))
      }
    end

    # КОММЕНТАРИЙ:
    # def input(name, attributes = {})
    #   @form_body[:inputs] << build_input_attributes(name, attributes)
    # end
    # где build_input_attributes
    # def build_input_attributes(name, attributes = {})
    ### тут должна быть логика получения данных из инпута для того, чтобы их вернуть хешом ниже
    #  {
    #    name:, type: tag_type, value: tag_value,
    #    label: build_label_attr(name)
    #  }.merge(attributes)
    # end
    #-------------------------------
    # А вот тут наверное не соглашусь. Label это прикол HTML, причем он по данным производный от input
    # и ничего нового в себе не содержит.
    # Поэтому я бы ее оставил в зоне ответственности html рендерера, который потом полиморфно себя начнет
    # вести когда появятся его разновидности для XML и т.п.

    def input(field, **options)
      @form_body[:inputs] << { field: field, options: options }
    end

    # КОММЕНТАРИЙ:
    # А далее метод обработки submit, который передал пользователь.
    #
    # def submit(value = 'Save', attributes = {})
    #   all_attributes = { tag: 'input', type: 'submit', value: }.merge(attributes)
    #   @form_body[:submit] = { options: all_attributes }
    # end
    #------------------------------------
    # И тут тоже самое, мне кажется нет смысла логику html тэгов сюда переносить, раз у нас идет сборка данных о
    # некоторой абстрактной форме, tag, input, type, submit -- это особенности html, а это все в рендерере
    # вроде как инкапсулировано должно быть.

    def submit(caption = DEFAULT_SUBMIT_NAME, **options)
      @form_body[:submit] = { caption: caption, options: options }
    end

    # 3) Давай не будем лишать возможности пользователя создавать пустую форму без инпутов,
    #     только с кнопкой submit. Давай уберем проверку на наличие блок с ошибкой, будем просто выполнять блок,
    #     если его передали, например так:
    #     yield(builded_form) if block_given?
    #---------------------------------------
    # Вот эту мысль не понял до конца.
    #   - Если блока нет, то нет и f.submit и не будет кнопки.
    #   - Если есть f.submit, то будет кнопка, но блок получается при этом есть.
    #   - Если я буду всегда вставлять submit, тогда становится бессмысленной DSL команда f.submit() без параметров,
    #       он там и так будет по умолчанию всегда, и эта команда будет ничего не делать.
    #   - f.submit() был в постановке задачи на одном из табов вроде.
    #
    # Поэтому, вероятно, это требование может звучать так: "если никаких элементов не задано в форме, добавить
    # один submit без параметров".
    #
    # Известно что ничего не добавлено станет только в момент считываения результатов, то есть пришем геттер.

    def data
      submit if @form_body[:inputs].empty? && @form_body[:submit][:caption].nil?
      @form_body
    end
  end
end
