# step 1 : identify the characters that lie between [a-z] => [97,122] and [A-Z] => [65,90]
# step 2: add shift to all characters in this range -> should lead to overflow
# step 3: loop back overflow with alphabet_size = 26  


def caesar_cipher( string_to_manipulate, cipher_shift )
    changed_string = ''
    puts string_to_manipulate
    string_array = string_to_manipulate.bytes
    # p string_array
    string_array.each_with_index do |num, idx|
        if ( ((num >= 97) and (num <= 122))  )
            string_array[idx] += cipher_shift
            if ( (num >= 123 - cipher_shift) )
                string_array[idx] -= 26
            end
        end
        if ((num >= 65) and (num <= 90))
            string_array[idx] += cipher_shift
            if( num >= 91 - cipher_shift )
                string_array[idx] -= 26
            end
        end
        changed_string += string_array[idx].chr
    end
    # p string_array
    puts changed_string
end

test_string = "abcde fghij klmno pqrst uvwxy z"
test_s = "The Magic OF BEing a MaN"
caesar_cipher(test_s, 1)
#bcde fghij klmno pqrst uvwxy