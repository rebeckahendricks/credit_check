class CreditCheck
  attr_reader :card_number, :limit

  def initialize(card_number, limit)
    @card_number = card_number
    @limit = limit
  end

  def is_valid?
    total_sum = calculate_luhn_sum(@card_number)
    if (total_sum % 10).zero?
      printf 'The number %s is valid!', @card_number
      true
    else
      printf 'The number %s is invalid!', @card_number
      false
    end
  end

  def calculate_luhn_sum(number_string)
    number_string.chars.reverse.each_with_index.map do |char, index|
      digit = char.to_i
      digit *= 2 if index.odd?
      digit > 9 ? digit - 9 : digit
    end.sum
  end

  def last_four
    @card_number[-4..]
  end

  def calculate_check_digit
    total_sum = calculate_luhn_sum(@card_number + '0')
    check_digit = (10 - (total_sum % 10)) % 10
    printf("The checksum digit is #{check_digit}")
  end
end
