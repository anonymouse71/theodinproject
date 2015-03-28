class Post
  attr_reader :title, :body
  def initialize(title, body)
    @title = title
    @body = body
  end

  def average_word_length
    words = body.split
    words.inject(0){|memo, word| memo += word.length} / words.count.to_f
  end
end

my_p = Post.new("Yo playa", "Sup son, this post is dope")
p my_p.average_word_length
