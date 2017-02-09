# UnitedStates

[![CircleCI](https://circleci.com/gh/kWhittington/united_states.svg?style=svg)](https://circleci.com/gh/kWhittington/united_states)

The names and abbreviations of each United States of America State.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'united_states'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install united_states

## Usage

```ruby
require 'united_states'

UnitedStates.all
# => [#<UnitedStates::State::Designation...@string="WY">]
UnitedStates.names
#=> [#<UnitedStates::State::Name...@string="Wyoming">]
UnitedStates.abbreviations
#=> [#<UnitedStates::State::Abbreviation...@string="WY"]
```

## Development

After checking out the repo, run `./bin/setup` to install dependencies.
Then, run `./bin/test` to run code quality checks and tests.
Then, run './bin/document' to generate `doc/` and open `doc/index.html`
to view the documentation. See
http://www.rubydoc.info/gems/yard/file/docs/GettingStarted.md for
documentation syntax.

You can also run `./bin/console` for an interactive prompt that will allow
you to experiment.

To install this gem onto your local machine, run `bundle exec rake
install`. To release a new version, update the version number in
`version.rb`, and then run `bundle exec rake release`, which will create a
git tag for the version, push git commits and tags, and push the
`.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/kWhittington/united_states. This project is intended
to be a safe, welcoming space for collaboration, and contributors are
expected to adhere to the
[Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
