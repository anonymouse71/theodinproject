def translate words
  vowels = %w{a e i o u}
  consonants = ('a'..'z').to_a - vowels
  words = words.split
  new_words = []

  words.each do |word|
    if vowels.include?(word[0])
      new_words << word + "ay"
    elsif word.slice(0..1) == "qu"
      new_words << word.slice(2..-1) + word.slice(0..1) + "ay"
    elsif word.slice(0..2).include? 'qu'
      new_words << word.slice(3..-1) + word.slice(0..2) + 'ay'
    elsif consonants.include?(word[0]) && consonants.include?(word[1]) && consonants.include?(word[2])
      new_words << word.split("").rotate(3).join("") + "ay"
    elsif consonants.include?(word[0]) && consonants.include?(word[1])
      new_words << word.split("").rotate(2).join("") + "ay"
    else
      new_words << word.split("").rotate.join("") + "ay"
    end
  end
  new_words.join(" ")
end
