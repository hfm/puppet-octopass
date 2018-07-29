# @summary Install the octopass package.
#
# @private
#
class octopass::install {

  package { 'octopass':
    ensure => $octopass::package_ensure,
  }

}
