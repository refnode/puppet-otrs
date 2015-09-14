require 'spec_helper'

describe 'otrs' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "otrs class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('otrs::params') }
          it { is_expected.to contain_class('otrs::install').that_comes_before('otrs::config') }
          it { is_expected.to contain_class('otrs::config') }
          it { is_expected.to contain_class('otrs::service').that_subscribes_to('otrs::config') }

          it { is_expected.to contain_service('otrs') }
          it { is_expected.to contain_package('otrs').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'otrs class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('otrs') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
