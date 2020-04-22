require 'spec_helper'

describe 'motd' do
  context 'default parameters' do
    it { is_expected.to compile.with_all_deps }
    it do
      is_expected.to contain_file('/etc/motd')
        .with_ensure('file')
        .with_content(/property of the Foreman project/)
    end
  end

  context 'with ensure absent parameters' do
    let(:params) { {ensure: 'absent'} }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file('/etc/motd').with_ensure('absent') }
  end
end
