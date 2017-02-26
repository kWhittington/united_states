# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

__Change Groups__:

`Added`, `Changed`, `Deprecated`, `Fixed`, `Removed`, `Security`

## [Unreleased]

## [1.2.0] - 2017-02-26
### Added
- `UnitedStates.config_path`
- `UnitedStates.array_from_yaml_file(path:)`
- `UnitedStates.array_from_yaml(yaml)`
- `UnitedStates.array_from_hashes(*hashes)`
- `UnitedStates::State::Designation.from_hash(**hash)`
- Example of `UnitedStates::State::Designation#initialize(...)`

### Changed
- `UnitedStates.all` to use `UnitedStates.array_from_yaml_file(path:)`

### Fixed
- `Designation`, `Name`, and `PostalCode` yard documentation typos.
- `"Abbrevation"` typos, now `"PostalCode"`.

## [1.1.1] - 2017-02-18
### Added
- `CircleCI` now tests against `Ruby` versions `2.1.10`, `2.2.6`, `2.3.3`, `2.4.0`.
- [`CHANGELOG.md`](CHANGELOG.md) following http://keepachangelog.com/en/0.3.0/.
- `./bin/circle_ci` for all `CircleCI`-specific scripts.

### Changed
- `./bin/` scripts are verbose.
- `README.md` `Development` section expanded with branching details.
- `README.md` `Deployment` section expanded with branching details.

## [1.1.0] - 2017-02-11
### Added
- `UnitedStates.find_by_name(name)` to find a `UnitedStates::State::Designation` with matching name.
- `UnitedStates.find_by_postal_code(postal_code)` to find a `UnitedStates::State::Designation` with matching postal code.
- `UnitedStates.[](name_or_postal_code)` to find a `UnitedStates::State::Designation` with matching name or postal code.
- Support for `Symbol` values as "name" or "postal code" parameters.

### Changed
- All references of `abbreviation` to `postal code`.
- `UnitedStates.abbreviations` -> `.postal_codes`
- `UnitedStates::State::Abbreviation` -> `UnitedStates::State::PostalCode`.
- `UnitedStates::State::Designation#abbreviation` -> `#postal_code`


## [1.0.2] - 2017-02-09
### Added
- Usage examples to `README.md`.

## [1.0.1] - 2017-02-08
### Fixed
- GitHub repo url in `README.md`.

## [1.0.0] - 2017-02-08
### Added
- `UnitedStates` module.
- `UnitedStates::State::Abbreviation` class.
- `UnitedStates::State::Designation` class.
- `UnitedStates::State::Name` class.
- `./bin/document` to generate documentation.
