# @summary Configure octopass.
#
# @private
#
class octopass::config {

  file { $octopass::configfile:
    ensure  => file,
    owner   => $octopass::configfile_owner,
    group   => $octopass::configfile_group,
    mode    => $octopass::configfile_mode,
    content => epp('octopass/octopass.conf.epp'),
  }

}
