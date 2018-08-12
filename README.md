# puppet-octopass [![Build Status](https://travis-ci.org/hfm/puppet-octopass.svg?branch=master)](https://travis-ci.org/hfm/puppet-octopass) [![Puppet Forge](https://img.shields.io/puppetforge/v/hfm/octopass.svg?style=flat-square)](https://forge.puppetlabs.com/hfm/octopass)

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with octopass](#setup)
    * [Setup requirements](#setup-requirements)
3. [Usage - Configuration options and additional functionality](#usage)
    * [Configuring modules in Puupet](#configuring-modules-in-puppet)
    * [Configuring modules from Hiera](#configuring-modules-from-hiera)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

The octopass module handles installing and configuring [octopass](https://github.com/linyows/octopass).

## Setup

### Setup Requirements

The octopass module requires the following puppet module:

- [puppetlabs-stdlib](https://forge.puppet.com/puppetlabs/stdlib): version 4.6.x or newer
- [puppetlabs-apt](https://forge.puppet.com/puppetlabs/apt): version 4.x (only Debian-based distributions).

note: puppetlabs-apt is soft dependencies. If you are installing on Debian systems, you will need to configure appropriate versions of this module.

## Usage

### Configuring modules in Puppet

To set up the octopass in Puppet codes, you can configure like the following:

```puppet
class { '::octopass':
  token        => 'iad87dih122ce66a1e20a751664c8a9dkoak87g7',
  organization => 'yourorganization',
  team         => 'yourteam',
}
```

### Configuring modules from Hiera

To set up octopass using Hiera, you declare `include ::octopass` in puppet manifests and configure in Hiera like the following:

```puppet
include ::octopass
```

```yaml
---
octopass::token: iad87dih122ce66a1e20a751664c8a9dkoak87g7
octopass::organization: yourorganization
octopass::team: yourteam
```

#### Configure with owner/repository

If you want to use a repository instead of team, you'd set `owner` and `repository`:

```yaml
octopass::token: iad87dih122ce66a1e20a751664c8a9dkoak87g7
octopass::owner: hfm
octopass::repository: puppet-octopass
```

#### Change group name

If you want to use other name of group than team or repository, you'd set `group`:

```yaml
octopass::token: iad87dih122ce66a1e20a751664c8a9dkoak87g7
octopass::organization: yourorganization
octopass::team: yourteam
octopass::group: othergroupname
```

#### For GitHub Enterprise

With GitHub Enterprise, you'd change `endpoint`:

```yaml
octopass::endpoint: 'https://git.yourorg.com'
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
