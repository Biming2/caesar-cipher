LOWERCASE_LETTERS = ('a'..'z').zip(1..26).to_h
UPPERCASE_LETTERS = ('A'..'Z').zip(1..26).to_h

def user_input(text, shift)
  while text.strip.empty?
    puts 'Please enter the text to cipher: '
    text = gets
  end

  puts 'Please enter the shift factor: '
  shift = gets.to_i
  
  return text, shift
end

def shifting(text, shift, letter_case)
  text.map! { |letter| letter_case[letter].nil? ? letter : letter_case[letter] }

  text.each_with_index do |letter, index|
    if letter.is_a? Integer
      text[index] = (letter + shift) % 26
      text[index] = 26 if text[index].zero?
      text[index] = letter_case.key(text[index])
    end
  end
end

def caesar_cipher(text, shift)
  text = text.split('')
  shifting(text, shift, LOWERCASE_LETTERS)
  shifting(text, shift, UPPERCASE_LETTERS)
  puts text.join('')
end

text, shift = user_input('', 0)
caesar_cipher(text, shift)
