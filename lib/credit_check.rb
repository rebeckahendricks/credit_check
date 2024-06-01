def valid?(card_number)
  total_sum = calculate_luhn_sum(card_number)
  if (total_sum % 10).zero?
    printf 'The number %s is valid!', card_number
  else
    printf 'The number %s is invalid!', card_number
  end
end

def calculate_luhn_sum(number_string)
  number_string.chars.reverse.each_with_index.map do |char, index|
    digit = char.to_i
    digit *= 2 if index.odd?
    digit > 9 ? digit - 9 : digit
  end.sum
end

card_number = '5541808923795240'
valid?(card_number)