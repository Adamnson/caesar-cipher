# frozen_string_literal: true

# step 1 : identify the characters that lie between [a-z] => [97,122] and [A-Z] => [65,90]
# step 2: add shift to all characters in this range -> should lead to overflow
# step 3: loop back overflow with alphabet_size = 26

# frozen_string_literal: false

BIG_A_CODE = 65
BIG_Z_CODE = 90
SMALL_A_CODE = 97
SMALL_Z_CODE = 122
ALPAHBET_SIZE = 26

# rubocop: disable Metrics/MethodLength
# rubocop: disable Metrics/AbcSize
def show_caesar_cipher(string_to_manipulate, cipher_shift)
  changed_string = ''
  string_array = string_to_manipulate.bytes # create ASCII character code array
  string_array.each_with_index do |char_code, idx|
    if (SMALL_A_CODE..SMALL_Z_CODE).include?(char_code)
      string_array[idx] += cipher_shift
      string_array[idx] -= ALPAHBET_SIZE if char_code >= SMALL_Z_CODE + 1 - cipher_shift
    end
    if (BIG_A_CODE..BIG_Z_CODE).include?(char_code)
      string_array[idx] += cipher_shift
      string_array[idx] -= ALPAHBET_SIZE if char_code >= BIG_Z_CODE + 1 - cipher_shift
    end
    changed_string += string_array[idx].chr
  end
  puts(string_to_manipulate, changed_string, "\n")
end
# rubocop: enable Metrics/MethodLength
# rubocop: enable Metrics/AbcSize

test_string = 'abcde fghij klmno pqrst uvwxy z'
test_s = 'The Magic OF BEing a MaN'
show_caesar_cipher(test_s, 1)
show_caesar_cipher(test_s, 13)

show_caesar_cipher(test_string, 12)
show_caesar_cipher(test_string, 19)
# bcde fghij klmno pqrst uvwxy
