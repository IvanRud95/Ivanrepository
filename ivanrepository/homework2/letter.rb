letters_arr = ("a".."z").to_a
vowels_arr = %w(a e i o u)
letters_hash = {}

vowels_arr.each { |letter| letters_hash[letter] = letters_arr.index(letter) + 1 }
