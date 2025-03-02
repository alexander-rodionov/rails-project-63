require_relative "lib/hexlet_code"

User = Struct.new(:name, :job, keyword_init: true)
user = User.new name: 'rob'
# User = Struct.new(:name, :job, :gender, keyword_init: true)
# user = User.new name: 'rob', job: 'hexlet', gender: 'm'

p HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end
