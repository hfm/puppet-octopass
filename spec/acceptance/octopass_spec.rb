require 'spec_helper_acceptance'

describe 'octopass class' do
  let(:manifest) do
    <<-MANIFEST
      include ::octopass
      include ::nsswitch
    MANIFEST
  end

  it 'runs without errors' do
    expect(apply_manifest(manifest, catch_failures: true).exit_code).to eq 2
  end

  it 'runs a second time without changes' do
    expect(apply_manifest(manifest).exit_code).to be_zero
  end

  context 'RedHat', if: os[:family] == 'redhat' do
    ['octopass', 'octopass-source'].each do |repo|
      describe yumrepo(repo) do
        it { is_expected.to exist }
        it { is_expected.to be_enabled }
      end
    end
  end

  context 'Debian', if: os[:family] =~ %r{^(ubuntu|debian)$} do
    describe package('lsb-release') do
      it { is_expected.to be_installed }
    end

    describe package('apt-transport-https') do
      it { is_expected.to be_installed }
    end

    describe file('/etc/apt/sources.list.d/octopass.list') do
      let(:id) { Specinfra.backend.run_command('lsb_release -s -i').stdout.strip.downcase }
      let(:distro) { Specinfra.backend.run_command('lsb_release -s -c').stdout.strip }

      it { is_expected.to be_file }
      its(:content) { is_expected.to match %r{^deb https://packagecloud.io/linyows/octopass/#{id}/ #{distro} main$} }
      its(:content) { is_expected.to match %r{^deb-src https://packagecloud.io/linyows/octopass/#{id}/ #{distro} main$} }
    end
  end

  describe package('octopass') do
    it { is_expected.to be_installed }
  end

  describe file('/etc/octopass.conf') do
    it { is_expected.to be_file }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
    it { is_expected.to be_mode 600 }
  end

  describe file('/etc/nsswitch.conf') do
    its(:content) { is_expected.to match %r{^passwd:\s+files octopass sss$} }
    its(:content) { is_expected.to match %r{^shadow:\s+files octopass sss$} }
    its(:content) { is_expected.to match %r{^group:\s+files octopass sss$} }
  end
end
