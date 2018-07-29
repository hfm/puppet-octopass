# @summary Setup the octopass repository for Debian/Ubuntu
#
# @private
#
class octopass::repo::apt {

  ensure_packages(['lsb-release', 'apt-transport-https'])

  $distro = downcase($facts['os']['name'])

  apt::source { 'octopass':
    location => "https://packagecloud.io/linyows/octopass/${distro}/",
    release  => $facts['lsbdistcodename'],
    repos    => 'main',
    key      => {
      id     => '47047C5D908257FF9A722B845ED5553A1ECCB79B',
      source => $::octopass::repo_gpgkey_url,
    },
    include  => {
      src => true,
      deb => true,
    },
    require  => [
      Package['lsb-release'],
      Package['apt-transport-https'],
    ],
  }

}
