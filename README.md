[![Version      ](https://img.shields.io/gem/v/active_record-narcissus.svg)](https://rubygems.org/gems/active_record-narcissus)
[![Build Status ](https://travis-ci.org/TwilightCoders/active_record-narcissus.svg)](https://travis-ci.org/TwilightCoders/active_record-narcissus)
[![Code Quality](https://api.codeclimate.com/v1/badges/bed7d7fcb79cafb7384e/maintainability)](https://codeclimate.com/github/TwilightCoders/active_record-narcissus/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/bed7d7fcb79cafb7384e/test_coverage)](https://codeclimate.com/github/TwilightCoders/active_record-narcissus/test_coverage)

# ActiveRecord::Narcissus

`ActiveRecord::Narcissus` lends a helping hand to `ActiveRecord` when it comes to reflecting on the correct class for associations, particularly `:through` associations. See [usage](#usage) bellow for more details.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_record-narcissus'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_record-narcissus

## Usage

ActiveRecord::Narcissus will automatically engage when ActiveRecord is loaded.

It works by slightly modifying the way ActiveRecord reflects on associations, particularly `:through` associations. Ths allows for the following to work automatically.

```ruby

Widget = Class.new(ActiveRecord::Base)

class User < ActiveRecord::Base
  # These will be of type User::Widget by default based on namespacing
  has_many :widgets 
end


class User
  class Widget < ::Widget
    self.table_name = "user_widgets"
    belongs_to :user
  end
end

class Post
  belongs_to :user
  has_many :user_widgets, through: :user, source: :widgets
end
```

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/TwilightCoders/active_record-narcissus). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActiveRecord::Narcissus project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/TwilightCoders/active_record-narcissus/blob/master/CODE_OF_CONDUCT.md).
