# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test # rubocop:disable Metrics/ClassLength
  User = Struct.new(:name, :job, :email, :gender, keyword_init: true)

  def setup
    @user = User.new(name: 'rob', job: 'hexlet', gender: 'm')
  end

  def test_that_it_has_a_version_number
    refute_nil(::HexletCode::VERSION)
  end

  def test_tag
    assert_equal(HexletCode::Tag.build(:br), '<br>')
    assert_equal(HexletCode::Tag.build(:img, src: 'path/to/image'), '<img src="path/to/image">')
    assert_equal(HexletCode::Tag.build(:input, type: 'submit', value: 'Save'), '<input type="submit" value="Save">')
    assert_equal((HexletCode::Tag.build(:label) { 'Email' }), '<label>Email</label>')
    assert_equal((HexletCode::Tag.build(:label, for: 'email') { 'Email' }), '<label for="email">Email</label>')
    assert_equal(HexletCode::Tag.build(:div), '<div></div>')
  end

  def test_basic_form
    result = HexletCode.form_for(@user) do |f|
      f.input(:name)
      f.input(:job, as: :text)
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_url
    result = HexletCode.form_for(@user, url: '/submit') do |f|
      f.input(:name)
      f.input(:job, as: :text)
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_additional_attributes
    result = HexletCode.form_for(@user, url: '#', method: 'get') do |f|
      f.input(:name, class: 'user-input')
      f.input(:job)
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_default_values
    result = HexletCode.form_for(@user) do |f|
      f.input(:job, as: :text)
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_overridden_default_values
    result = HexletCode.form_for(@user, url: '#') do |f|
      f.input(:job, as: :text, rows: 50, cols: 50)
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_missing_field
    assert_raises(NoMethodError) do
      HexletCode.form_for(@user, url: '/users') do |f|
        f.input(:name)
        f.input(:job, as: :text)
        f.input(:age)
      end
    end
  end

  def test_form_only_submit
    result = HexletCode.form_for(@user, url: '/users')
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_submit_button
    result = HexletCode.form_for(@user) do |f|
      f.input(:name)
      f.input(:job, as: :text)
      f.submit('Save')
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_custom_submit_button
    result = HexletCode.form_for(@user) do |f|
      f.input(:name)
      f.input(:job, as: :text)
      f.submit('Save', class: 'btn-primary')
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_multiple_inputs
    result = HexletCode.form_for(@user) do |f|
      f.input(:name)
      f.input(:job, as: :text)
      f.input(:gender)
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_empty_block
    result = HexletCode.form_for(@user) do |f| # rubocop:disable Lint/EmptyBlock
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_custom_method
    result = HexletCode.form_for(@user, method: 'put') do |f|
      f.input(:name)
      f.input(:job, as: :text)
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_custom_attributes
    result = HexletCode.form_for(@user, url: '#', class: 'form-class', id: 'form-id') do |f|
      f.input(:name)
      f.input(:job, as: :text)
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_input_and_submit
    result = HexletCode.form_for(@user) do |f|
      f.input(:name)
      f.submit('Submit')
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_input_and_custom_submit
    result = HexletCode.form_for(@user) do |f|
      f.input(:name)
      f.submit('Save', class: 'btn-primary')
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_input_and_textarea
    result = HexletCode.form_for(@user) do |f|
      f.input(:name)
      f.input(:job, as: :text)
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_input_and_textarea_with_attributes
    result = HexletCode.form_for(@user) do |f|
      f.input(:name)
      f.input(:job, as: :text, rows: 50, cols: 50)
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_input_and_textarea_and_submit
    result = HexletCode.form_for(@user) do |f|
      f.input(:name)
      f.input(:job, as: :text)
      f.submit('Submit')
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_input_and_textarea_and_custom_submit
    result = HexletCode.form_for(@user) do |f|
      f.input(:name)
      f.input(:job, as: :text)
      f.submit('Save', class: 'btn-primary')
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_input_and_textarea_and_submit_with_attributes
    result = HexletCode.form_for(@user) do |f|
      f.input(:name)
      f.input(:job, as: :text, rows: 50, cols: 50)
      f.submit('Submit')
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_input_and_textarea_and_custom_submit_with_attributes
    result = HexletCode.form_for(@user) do |f|
      f.input(:name)
      f.input(:job, as: :text, rows: 50, cols: 50)
      f.submit('Save', class: 'btn-primary')
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_input_and_textarea_and_submit_and_custom_attributes
    result = HexletCode.form_for(@user, url: '#', class: 'form-class', id: 'form-id') do |f|
      f.input(:name)
      f.input(:job, as: :text)
      f.submit('Submit')
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_input_and_textarea_and_custom_submit_and_custom_attributes
    result = HexletCode.form_for(@user, url: '#', class: 'form-class', id: 'form-id') do |f|
      f.input(:name)
      f.input(:job, as: :text)
      f.submit('Save', class: 'btn-primary')
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_input_and_textarea_and_submit_with_attributes_and_custom_attributes
    result = HexletCode.form_for(@user, url: '#', class: 'form-class', id: 'form-id') do |f|
      f.input(:name)
      f.input(:job, as: :text, rows: 50, cols: 50)
      f.submit('Submit')
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_input_and_textarea_and_custom_submit_with_attributes_and_custom_attributes
    result = HexletCode.form_for(@user, url: '#', class: 'form-class', id: 'form-id') do |f|
      f.input(:name)
      f.input(:job, as: :text, rows: 50, cols: 50)
      f.submit('Save', class: 'btn-primary')
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_input_and_textarea_and_submit_and_custom_attributes_and_method
    result = HexletCode.form_for(@user, url: '#', class: 'form-class', id: 'form-id', method: 'put') do |f|
      f.input(:name)
      f.input(:job, as: :text)
      f.submit('Submit')
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_input_and_textarea_and_custom_submit_and_custom_attributes_and_method
    result = HexletCode.form_for(@user, url: '#', class: 'form-class', id: 'form-id', method: 'put') do |f|
      f.input(:name)
      f.input(:job, as: :text)
      f.submit('Save', class: 'btn-primary')
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_input_and_textarea_and_submit_with_attributes_and_custom_attributes_and_method
    result = HexletCode.form_for(@user, url: '#', class: 'form-class', id: 'form-id', method: 'put') do |f|
      f.input(:name)
      f.input(:job, as: :text, rows: 50, cols: 50)
      f.submit('Submit')
    end
    assert_equal(load_expected(__method__), result)
  end

  def test_form_with_input_and_textarea_and_custom_submit_with_attributes_and_custom_attributes_and_method
    result = HexletCode.form_for(@user, url: '#', class: 'form-class', id: 'form-id', method: 'put') do |f|
      f.input(:name)
      f.input(:job, as: :text, rows: 50, cols: 50)
      f.submit('Save', class: 'btn-primary')
    end
    assert_equal(load_expected(__method__), result)
  end
end
