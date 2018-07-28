# puppet-octopass [![Build Status](https://travis-ci.org/hfm/puppet-octopass.svg?branch=master)](https://travis-ci.org/hfm/puppet-octopass) [![Puppet Forge](https://img.shields.io/puppetforge/v/hfm/octopass.svg?style=flat-square)](https://forge.puppetlabs.com/hfm/octopass)

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with octopass](#setup)
    * [What octopass affects](#what-octopass-affects)
    * [Setup requirements](#setup-requirements)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

The octopass module handles installing and configuring[octopass](https://github.com/linyows/octopass).

## Setup

### What octopass affects **OPTIONAL**

If it's obvious what your module touches, you can skip this section. For example, folks can probably figure out that your mysql_instance module affects their MySQL instances.

If there's more that they should know about, though, this is the place to mention:

* Files, packages, services, or operations that the module will alter, impact, or execute.
* Dependencies that your module automatically installs.
* Warnings or other important notices.

### Setup Requirements

The octopass module requires the following puppet module:

- [puppetlabs-stdlib](https://forge.puppet.com/puppetlabs/stdlib): version 4.6.x or newer
- [puppetlabs-apt](https://forge.puppet.com/puppetlabs/apt): version 4.x (only Debian-based distributions).

note: puppetlabs-apt is soft dependencies. If you are installing on Debian systems, you will need to configure appropriate versions of this module.

## Usage

Include usage examples for common use cases in the **Usage** section. Show your users how to use your module to solve problems, and be sure to include code examples. Include three to five examples of the most important or common tasks a user can accomplish with your module. Show users how to accomplish more complex tasks that involve different types, classes, and functions working in tandem.

## Reference

This section is deprecated. Instead, add reference information to your code as Puppet Strings comments, and then use Strings to generate a REFERENCE.md in your module. For details on how to add code comments and generate documentation with Strings, see the Puppet Strings [documentation](https://puppet.com/docs/puppet/latest/puppet_strings.html) and [style guide](https://puppet.com/docs/puppet/latest/puppet_strings_style.html)

If you aren't ready to use Strings yet, manually create a REFERENCE.md in the root of your module directory and list out each of your module's classes, defined types, facts, functions, Puppet tasks, task plans, and resource types and providers, along with the parameters for each.

For each element (class, defined type, function, and so on), list:

  * The data type, if applicable.
  * A description of what the element does.
  * Valid values, if the data type doesn't make it obvious.
  * Default value, if any.

For example:

```
### `pet::cat`

#### Parameters

##### `meow`

Enables vocalization in your cat. Valid options: 'string'.

Default: 'medium-loud'.
```

## Limitations

See `operatingsystem_support` in [metadata.json](./metadata.json)

## Development

### Running tests

The octopass puppet module contains tests for both [rspec-puppet](http://rspec-puppet.com) (unit tests) and [beaker-rspec](https://github.com/puppetlabs/beaker-rspec) (acceptance tests) to verify functionality. For detailed information on using these tools, please see their respective documentation.

#### Testing quickstart

- Unit tests:

```console
$ bundle install
$ bundle exec rake
```

- Acceptance tests:

```console
# Set your DOCKER_HOST variable
$ eval "$(docker-machine env default)"

# List available beaker nodesets
$ bundle exec rake beaker_nodes
centos7
stretch
xenial

# Run beaker acceptance tests
$ BEAKER_set=debian9 bundle exec rake beaker
```
