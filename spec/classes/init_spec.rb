require 'spec_helper'

describe 'motd' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      describe 'with default parameters' do
        it { is_expected.to compile.with_all_deps }

        it 'should contain a valid /etc/motd' do
          is_expected.to contain_file('/etc/motd')
            .with_ensure('file')
            .with_content(/property of the Foreman project/)
            .with_content(/FQDN:\s+#{facts['fqdn']}/)
            .with_content(/Kernel:\s+#{facts['kernelrelease']}/)
            .with_content(/Memory:\s#{facts['memorysize']}/)
        end
      end

      describe 'with ensure absent parameters' do
        let(:params) { {ensure: 'absent'} }

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_file('/etc/motd').with_ensure('absent') }
      end
    end
  end
end
