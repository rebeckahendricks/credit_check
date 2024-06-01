require 'rspec'
require './lib/credit_check'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe CreditCheck do
  let(:valid_card_number) { '5541808923795240' }
  let(:invalid_card_number) { '5541801923795240' }
  let(:credit_check_valid) { CreditCheck.new(valid_card_number, 15_000) }
  let(:credit_check_invalid) { CreditCheck.new(invalid_card_number, 15_000) }

  describe 'initialization' do
    it 'exists' do
      expect(credit_check_valid).to be_a CreditCheck
    end

    it 'has a card_number and a limit' do
      expect(credit_check_valid.card_number).to eq valid_card_number
      expect(credit_check_valid.limit).to eq 15_000
    end
  end
end

RSpec.describe CreditCheck, '#is_valid?' do
  let(:valid_card_number) { '5541808923795240' }
  let(:invalid_card_number) { '5541801923795240' }
  let(:credit_check_valid) { CreditCheck.new(valid_card_number, 15_000) }
  let(:credit_check_invalid) { CreditCheck.new(invalid_card_number, 15_000) }

  it 'returns true for a valid card number' do
    expect(credit_check_valid.is_valid?).to be true
  end

  it 'returns false for an invalid card number' do
    expect(credit_check_invalid.is_valid?).to be false
  end
end

RSpec.describe CreditCheck, '#calculate_luhn_sum' do
  let(:valid_card_number) { '5541808923795240' }
  let(:invalid_card_number) { '5541801923795240' }
  let(:credit_check_valid) { CreditCheck.new(valid_card_number, 15_000) }
  let(:credit_check_invalid) { CreditCheck.new(invalid_card_number, 15_000) }

  it 'calculates the correct Luhn sum for a valid card' do
    expect(credit_check_valid.calculate_luhn_sum).to eq 70
  end

  it 'calculates the correct Luhn sum for an invalid card' do
    expect(credit_check_invalid.calculate_luhn_sum).to eq 65
  end
end

RSpec.describe CreditCheck, '#last_four' do
  it 'returns the correct last four digits' do
    credit_check1 = CreditCheck.new('1234567890', 15_000)
    credit_check2 = CreditCheck.new('0987654321', 15_000)
    expect(credit_check1.last_four).to eq '7890'
    expect(credit_check2.last_four).to eq '4321'
  end
end
