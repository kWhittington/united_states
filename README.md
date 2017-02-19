# UnitedStates

[![CircleCI](https://circleci.com/gh/kWhittington/united_states.svg?style=svg)](https://circleci.com/gh/kWhittington/united_states)

The names and postal codes of each United States of America State.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'united_states'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install united_states

`united_states` is tested against the following [stable `ruby` versions](https://www.ruby-lang.org/en/downloads/):
  * MRI 2.1.10
  * MRI 2.2.6
  * MRI 2.3.3
  * MRI 2.4.0

## Usage

```ruby
require 'united_states'

UnitedStates.all
# => [#<UnitedStates::State::Designation...@string="WY">]
UnitedStates.names
#=> [#<UnitedStates::State::Name...@string="Wyoming">]
UnitedStates.postal_codes
#=> [#<UnitedStates::State::PostalCode...@string="WY"]
UnitedStates[:LA]
# => [#<UnitedStates::State::Designation...@string="LA">]
UnitedStates['mississippi']
# => [#<UnitedStates::State::Designation...@string="MS">]
UnitedStates['car']
# => UnitedStates::NoDesignationFoundError
```

## Development

### Branching

Checkout the repo. If making a `hot_fix` branch, branch from
`master`. If making a `bug_fix`/`chore`/`enhancement` branch,
branch from
[`development`](https://github.com/kWhittington/united_states/tree/develop).
Be sure to update [`CHANGELOG.md`](CHANGELOG.md)
(see http://keepachangelog.com/en/0.3.0/) with your changes.

### Setup
Run `./bin/setup` to install dependencies.

### Testing
Run `./bin/test` to run code quality checks and tests.

### Documenting
Run `./bin/document` to generate `doc/` and open
[`doc/index.html`](doc/index.html)
to view the documentation. See
http://www.rubydoc.info/gems/yard/file/docs/GettingStarted.md for
documentation syntax.

### Seat-of-the-Pants Testing
Run `./bin/console` for an interactive prompt that will allow
you to experiment.

### Manual installation
To install this gem onto your local machine, run `bundle exec rake
install`.

### Deployment
To release a new version, you must first have authorization to push
to `rubygems`. If so, update the version number in
[`lib/united_states/version.rb`](lib/united_states/version.rb),
and then run `bundle exec rake release`, which will create a
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
