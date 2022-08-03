require 'spec_helper_acceptance'

describe 'basic usage' do
  include_examples 'an idempotent resource' do
    let(:manifest) { 'include motd' }
  end

  specify do
    expect(file('/etc/motd')).to have_attributes(content: /Foreman project/)
  end
end
