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
to `rubygems`. If so, make a new
`chore/#ISSUE_NUMBER_update_version_to_MAJOR_MINOR_PATCH`, update
`UnitedStates::VERSION` number (per
[Semantic Versioning](http://semver.org/)) in
[`lib/united_states/version.rb`](lib/united_states/version.rb),
change the `Unreleased` section of `CHANGELOG.md` to the new version
number, and then make a pull request merging to `development`.

After `development` has been updated with the new version number,
a new `release/MAJOR.MINOR.PATCH` branch needs to be pushed up-stream.
We'll want to squash all changes for the new version into a single commit
onto `master`. To accomplish this, you can branch the release branch off of
`development` and then rebase it with `origin/master`, handling any
conflicts. Once the release branch can me fast-forward merged with
`master`, push the release branch up-stream and make a pull request
into `master`.

```bash
git fetch
git checkout development
git pull # if local branch needs updating
git checkout -b release/1.3.1
git rebase origin/master
git push -u origin release/1.3.1
```

Once `master` has been updated, checkout the latest `master`
and run `bundle exec rake release`, which will create a
git tag for the version, push git commits and tags, and push the
`.gem` file to [rubygems.org](https://rubygems.org).

```bash
git fetch
git checkout master
git pull # if local branch needs updating
bundle exec rake release
united_states 1.3.1 built to pkg/united_states-1.3.1.gem.
Tagged v1.3.1.
Pushed git commits and tags.
Pushed united_states 1.3.1 to rubygems.org.
```

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/kWhittington/united_states. This project is intended
to be a safe, welcoming space for collaboration, and contributors are
expected to adhere to the
[Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
