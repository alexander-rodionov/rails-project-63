# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test # rubocop:disable Metrics/ClassLength
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_tag
    assert_equal HexletCode::Tag.build("br"), "<br>"
    assert_equal HexletCode::Tag.build("img", src: "path/to/image"), '<img src="path/to/image">'
    assert_equal HexletCode::Tag.build("input", type: "submit", value: "Save"), '<input type="submit" value="Save">'
    assert_equal (HexletCode::Tag.build("label") { "Email" }), "<label>Email</label>"
    assert_equal (HexletCode::Tag.build("label", for: "email") { "Email" }), '<label for="email">Email</label>'
    assert_equal HexletCode::Tag.build("div"), "<div></div>"
  end

  User = Struct.new(:name, :job, :email, keyword_init: true)

  def test_basic_form
    user = User.new(name: "rob")
    expected = '<form action="#" method="post"></form>'
    result = nil
    HexletCode.form_for(user) { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_class
    user = User.new(name: "rob")
    expected = '<form action="#" method="post" class="hexlet-form"></form>'
    result = nil
    HexletCode.form_for(user, class: "hexlet-form") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_url
    user = User.new(name: "rob")
    expected = '<form action="/profile" method="post"></form>'
    result = nil
    HexletCode.form_for(user, url: "/profile") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_url_and_class
    user = User.new(name: "rob")
    expected = '<form action="/profile" method="post" class="hexlet-form"></form>'
    result = nil
    HexletCode.form_for(user, url: "/profile", class: "hexlet-form") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_method_get
    user = User.new(name: "rob")
    expected = '<form action="#" method="get"></form>'
    result = nil
    HexletCode.form_for(user, method: "get") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_method_get_and_class
    user = User.new(name: "rob")
    expected = '<form action="#" method="get" class="hexlet-form"></form>'
    result = nil
    HexletCode.form_for(user, method: "get", class: "hexlet-form") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_method_get_and_url
    user = User.new(name: "rob")
    expected = '<form action="/profile" method="get"></form>'
    result = nil
    HexletCode.form_for(user, method: "get", url: "/profile") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_method_get_url_and_class
    user = User.new(name: "rob")
    expected = '<form action="/profile" method="get" class="hexlet-form"></form>'
    result = nil
    HexletCode.form_for(user, method: "get", url: "/profile", class: "hexlet-form") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_id
    user = User.new(name: "rob")
    expected = '<form action="#" method="post" id="user-form"></form>'
    result = nil
    HexletCode.form_for(user, id: "user-form") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_id_and_class
    user = User.new(name: "rob")
    expected = '<form action="#" method="post" id="user-form" class="hexlet-form"></form>'
    result = nil
    HexletCode.form_for(user, id: "user-form", class: "hexlet-form") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_id_and_url
    user = User.new(name: "rob")
    expected = '<form action="/profile" method="post" id="user-form"></form>'
    result = nil
    HexletCode.form_for(user, id: "user-form", url: "/profile") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_id_url_and_class
    user = User.new(name: "rob")
    expected = '<form action="/profile" method="post" id="user-form" class="hexlet-form"></form>'
    result = nil
    HexletCode.form_for(user, id: "user-form", url: "/profile", class: "hexlet-form") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_id_method_get
    user = User.new(name: "rob")
    expected = '<form action="#" method="get" id="user-form"></form>'
    result = nil
    HexletCode.form_for(user, id: "user-form", method: "get") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_id_method_get_and_class
    user = User.new(name: "rob")
    expected = '<form action="#" method="get" id="user-form" class="hexlet-form"></form>'
    result = nil
    HexletCode.form_for(user, id: "user-form", method: "get", class: "hexlet-form") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_id_method_get_and_url
    user = User.new(name: "rob")
    expected = '<form action="/profile" method="get" id="user-form"></form>'
    result = nil
    HexletCode.form_for(user, id: "user-form", method: "get", url: "/profile") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_id_method_get_url_and_class
    user = User.new(name: "rob")
    expected = '<form action="/profile" method="get" id="user-form" class="hexlet-form"></form>'
    result = nil
    HexletCode.form_for(user, id: "user-form", method: "get", url: "/profile", class: "hexlet-form") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_data_attribute
    user = User.new(name: "rob")
    expected = '<form action="#" method="post" data-remote="true"></form>'
    result = nil
    HexletCode.form_for(user, data_remote: true) { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_data_attribute_and_class
    user = User.new(name: "rob")
    expected = '<form action="#" method="post" data-remote="true" class="hexlet-form"></form>'
    result = nil
    HexletCode.form_for(user, data_remote: true, class: "hexlet-form") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_data_attribute_and_url
    user = User.new(name: "rob")
    expected = '<form action="/profile" method="post" data-remote="true"></form>'
    result = nil
    HexletCode.form_for(user, data_remote: true, url: "/profile") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_data_attribute_url_and_class
    user = User.new(name: "rob")
    expected = '<form action="/profile" method="post" data-remote="true" class="hexlet-form"></form>'
    result = nil
    HexletCode.form_for(user, data_remote: true, url: "/profile", class: "hexlet-form") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_additional_fields
    user = User.new(name: "rob", job: "developer", email: "rob@example.com")
    expected = '<form action="#" method="post"></form>'
    result = nil
    HexletCode.form_for(user) { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_additional_fields_and_class
    user = User.new(name: "rob", job: "developer", email: "rob@example.com")
    expected = '<form action="#" method="post" class="hexlet-form"></form>'
    result = nil
    HexletCode.form_for(user, class: "hexlet-form") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_additional_fields_and_url
    user = User.new(name: "rob", job: "developer", email: "rob@example.com")
    expected = '<form action="/profile" method="post"></form>'
    result = nil
    HexletCode.form_for(user, url: "/profile") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_with_additional_fields_url_and_class
    user = User.new(name: "rob", job: "developer", email: "rob@example.com")
    expected = '<form action="/profile" method="post" class="hexlet-form"></form>'
    result = nil
    HexletCode.form_for(user, url: "/profile", class: "hexlet-form") { |f| result = f }
    assert_equal expected, result
  end

  def test_form_without_block
    user = User.new(name: "rob")
    assert_raises(LocalJumpError) { HexletCode.form_for(user) }
  end
end
