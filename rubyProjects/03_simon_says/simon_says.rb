#compelted challenge
def echo word
  word
end

def shout word
  word.upcase!
end

def repeat word, repeat_word = 2
  words = []
  repeat_word.times { words << word }
  words.join(" ")
end

def start_of_word word, count = 1
  word[0] if count == 1
  word[0..count-1]
end

def first_word sentence
  words = sentence.split
  words[0]
end

def titleize sentence
  little_words = %w{and over the}
  new_sentence = sentence.split(" ").map do |word|
    if little_words.include?(word)
      word
    else
      word.capitalize
    end
  end
  new_sentence[0].capitalize!
  new_sentence.join(" ")
end
