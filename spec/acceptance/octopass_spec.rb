require 'spec_helper_acceptance'

describe 'octopass class' do
  let(:manifest) { 'include ::octopass' }

  it 'runs without errors' do
    expect(apply_manifest(manifest, catch_failures: true).exit_code).to eq 2
  end

  it 'runs a second time without changes' do
    expect(apply_manifest(manifest).exit_code).to be_zero
  end

  context 'RedHat', if: os[:family] == 'redhat' do
    %w[octopass octopass-source].each do |repo|
      describe yumrepo(repo) do
        it { is_expected.to exist }
        it { is_expected.to be_enabled }
      end
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
end
