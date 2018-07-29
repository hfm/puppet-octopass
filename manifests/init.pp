# @summary Install and configure octopass.
#
# @example Basic usage
#   class { '::octopass':
#     token        => 'iad87dih122ce66a1e20a751664c8a9dkoak87g7',
#     organization => 'yourorganization',
#     team         => 'yourteam',
#   }
#
# @see https://github.com/linyows/octopass
#
# @param repo_ensure
#   The resource should be in.
# @param repo_gpgkey_url
#   The URL to GPG key for a package repository.
# @param package_ensure
#   What state the package should be in.
# @param configfile
#   The path to the default configuration.
# @param configfile_owner
#   The user to whom the file should belong.
# @param configfile_group
#   Which group should own the file.
# @param configfile_mode
#   The desired permissions mode for the file, in symbolic or numeric notation.
# @param token
#   GitHub Personal Access Token.
# @param organization
#   GitHub organization
# @param team
#   GitHub team
# @param owner
#   GitHub onwer
# @param repository
#   GitHub repository
# @param endpoint
#   The URL to endpoint.
# @param group
#   The group to which the user belongs.
# @param home
#   The user's home directory.
# @param shell
#   Login shell.
# @param uid_starts
#   UID number to start.
# @param gid
#   GID number.
# @param cache
#   GitHub API cache second.
# @param syslog
#   Whether use syslog.
# @param shared_users
#   An array of shared users to associate with PHP.
#
class octopass (
  String $repo_ensure,
  String $repo_gpgkey_url,
  String $package_ensure,
  String $configfile,
  String $configfile_owner,
  String $configfile_group,
  String $configfile_mode,
  String $token,
  String $organization,
  String $team,
  String $owner,
  Optional[String] $repository,
  String $endpoint,
  Optional[String] $group,
  Optional[String] $home,
  Optional[String] $shell,
  Integer $uid_starts,
  Integer $gid,
  Integer $cache,
  Boolean $syslog,
  Optional[Array[String]] $shared_users,
) {

  include octopass::repo
  include octopass::install
  include octopass::config

  Class['::octopass::repo']
  -> Class['::octopass::install']
  -> Class['::octopass::config']

}
