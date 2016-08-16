# Given an input "(952) 7nine7 - 55 five five"
# Output a string "9527975555"

# input = "(952) 7nine7 - 55 five five"
input = "(952) 797 - 55five f i v e"
input = "612-702-nine-three-zero-two"
expected_string = "6127029302"

str_to_int_hash = {
  'zero'  => 0,
  'one'   => 1,
  'two'   => 2,
  'three' => 3,
  'four'  => 4,
  'five'  => 5,
  'six'   => 6,
  'seven' => 7,
  'eight' => 8,
  'nine'  => 9
}


phone_number = []
letters = []
input.each_char do |char|
  #check if the character is a number
  if char =~ /[[:digit:]]/
    phone_number << char
  elsif char =~ /[[:alpha:]]/
    # Capture the non-digit character into a letters array.
    # Once letters array contains a valid number (in word format)
    # we convert it to a integer
    letters << char

    converted_digit = str_to_int_hash[letters.join].to_s
    if converted_digit != ""
      # Our code worked!  We can add the new digit into our phone array!
      phone_number << converted_digit

      # We need to set up our code now
      letters = []
    end
  end
end

puts phone_number.inspect
puts "IT WORKS!" if phone_number.join == expected_string

