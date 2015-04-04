#create a cipher shifts the output n times.

def caesar_cipher sentence, num
  alphabet = ('a'..'z').to_a + %w{a b c}
  p alphabet
  encrypted_sentence = []
  chars = sentence.downcase.split("")

  chars.each do |char|
    if alphabet.include?(char)
      encrypted_sentence.push(alphabet[alphabet.index(char) + num])
    else
      encrypted_sentence.push(char)
    end
  end
  encrypted_sentence.join.capitalize!!
end

p caesar_cipher("What a string!", 5)
