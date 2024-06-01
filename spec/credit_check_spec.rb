require 'rspec'
require './lib/credit_check'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe CreditCheck do
  it 'exists' do
    credit_check = CreditCheck.new('4034007106512380')
    expect(credit_check).to be_a CreditCheck
  end
end