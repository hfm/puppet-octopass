# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include octopass::repo
class octopass::repo (
  String $ensure = 'present',
  String $gpgkey_url = 'https://packagecloud.io/linyows/octopass/gpgkey',
) {

  case $facts['os']['family'] {
    'RedHat': {
      yumrepo {
        default:
          ensure          => $ensure,
          repo_gpgcheck   => 1,
          gpgcheck        => 0,
          enabled         => 1,
          gpgkey          => $gpgkey_url,
          sslverify       => 1,
          sslcacert       => '/etc/pki/tls/certs/ca-bundle.crt',
          metadata_expire => 300;

        'octopass':
          descr           => 'linyows_octopass',
          baseurl         => 'https://packagecloud.io/linyows/octopass/el/7/$basearch';

        'octopass-source':
          descr           => 'linyows_octopass-source',
          baseurl         => 'https://packagecloud.io/linyows/octopass/el/7/SRPMS';
      }
    }
    'Debian': {
      include ::apt
      require ::apt::update
      include octopass::repo::apt
    }
    default: {
      fail("Unsupported os: ${facts['os']['name']}")
    }
  }
}
