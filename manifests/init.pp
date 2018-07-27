# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include octopass
class octopass (
  String $repo_ensure,
  String $repo_gpgkey_url,
  String $package_ensure,
  String $configfile,
  String $configfile_owner,
  String $configfile_group,
  String $configfile_mode,
  String $token,
  String $owner,
  String $repository,
  String $endpoint,
  String $group,
  String $home,
  String $shell,
  Integer $uid_starts,
  Integer $gid,
  Integer $cache,
  Boolean $syslog,
) {

  include octopass::repo
  include octopass::install
  include octopass::config

  Class['::octopass::repo']
  -> Class['::octopass::install']
  -> Class['::octopass::config']

}
