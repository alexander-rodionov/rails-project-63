# HexletCode Form Builder

HexletCode is a Ruby library designed to simplify the creation of HTML forms using a Ruby DSL (Domain Specific Language). This library allows you to define forms programmatically, making it easier to manage form attributes and inputs dynamically.

## Features

- **Form Generation**: Easily generate HTML forms with custom attributes.
- **Input Types**: Supports various input types, including text fields and textareas.
- **Customization**: Allows customization of form and input attributes.
- **Error Handling**: Provides basic error handling for missing fields and blocks.

## Installation

To use HexletCode in your project, follow these steps:

1. **Add the library to your project**:
   - If you're using Bundler, add the following line to your `Gemfile`:
  
     ```ruby
     gem 'hexlet_code'
     ```

   - Then run `bundle install` to install the gem.

2. **Require the library in your Ruby file**:

    ```ruby
    require 'hexlet_code'
    ```

## Usage

Here's a basic example of how to use HexletCode to generate a form:
```ruby

require 'hexlet_code'

# Define a user struct with fields
User = Struct.new(\:name, \:job, \:email, \:gender, keyword_init: true)

# Create a user instance
user = User.new(name: 'rob', job: 'hexlet', gender: 'm')

# Generate a form for the user
result = HexletCode.form_for(user) do |f|
  f.input \:name
  f.input \:job, as: \:text
  f.submit 'Submit'
end

puts result
```

Output:

```html
<form action="#" method="post">
  <label for="name">Name</label>
  <input name="name" type="text" value="rob">
  <label for="job">Job</label>
  <textarea name="job" cols="20" rows="40">hexlet</textarea>
  <input type="submit" value="Submit">
</form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).
