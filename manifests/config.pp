# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include octopass::config
class octopass::config {

  file { $octopass::configfile:
    ensure  => file,
    owner   => $octopass::configfile_owner,
    group   => $octopass::configfile_group,
    mode    => $octopass::configfile_mode,
    content => epp('octopass/octopass.conf.epp'),
  }

}
