#completed challenge
class Book
  attr_accessor :title

  def title
    words = @title.split
    exceptions = %w{and in the of a an}
    words.each do |word|
      if exceptions.include?(word)
        word
      else
        word.capitalize!
      end
    end
    words[0].capitalize!
    words.join(" ")
  end
end
