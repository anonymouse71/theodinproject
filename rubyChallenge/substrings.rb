#Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substring sentence, dictionary
  word_count = Hash.new(0)
  words = sentence.downcase.split

  words.each do |word|
    dictionary.each do |dictonary_word|
      word_count[dictonary_word] += 1 if word.include?(dictonary_word)
    end
  end
  word_count
end

p substring "below", dictionary
p substring "Howdy partner, sit down! How's it going?", dictionary 
