# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include octopass::install
class octopass::install {

  package { 'octopass':
    ensure => $octopass::package_ensure,
  }

}
