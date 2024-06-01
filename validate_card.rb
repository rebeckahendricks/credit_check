require 'pry'
require_relative './lib/credit_check'

def display_help
  puts <<-HELP
    Usage: validate_card.rb [options] CARD_NUMBER

    Options:
      -v, --validate       Validate the credit card number
      -c, --check-digit    Calculate the check digit for the credit card number
      -h, --help           Display this help message
  HELP
end

if ARGV.empty?
  display_help
  exit
end

option = ARGV.shift # 1st argument
card_number = ARGV.shift # 2nd argument
limit = ARGV.shift # Not utilized in current implementation, but could be the 3rd argument

if card_number.nil?
  puts 'Error: CARD_NUMBER is required'
  display_help
  exit 1
end

credit_check = CreditCheck.new(card_number, limit)

case option
when '-v', '--validate'
  credit_check.is_valid?
when '-c', '--check-digit'
  credit_check.calculate_check_digit
else
  display_help
end
