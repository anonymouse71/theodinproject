module Hangman
  class Game
    attr_reader :board, :secret_word, :missed_words, :guess_count
    def initialize
      @file = File.open("5desk.txt", "r"){|file| file.read}
      @valid_words = get_valid_words! @file
      @guess_count = 0
      @secret_word = secret_word
      @board = Array.new(@secret_word.length){"_"}
      @missed_words = []
    end

    def get_valid_words! file
      file.split.select {|word| word.length.between?(5,13)}
    end

    def secret_word
      @valid_words.sample.downcase
    end

    def guess!
      user_input = View.get_guess
      if @secret_word.include?(user_input)
        @board[@secret_word.index(user_input)] = user_input
      else
        @missed_words << user_input
        @guess_count +=1
      end
    end

    def play!
      View.greeting
      return View.congratulations! if @board.none?{|c|c == "_"}
      until @guess_count > 9
        View.render_board @board
        View.render_missed_words @missed_words
        View.render_guess_count @guess_count
        guess!
      end
      View.game_over! @secret_word
    end
  end
end

module Hangman
  class View
    def self.greeting
      puts
      puts "Welcome to Hangman!"
      puts
    end

    def self.congratulations!
      puts "Ding Ding! We have a winner! Thanks for playing..."
    end

    def self.game_over! secret_word
      puts "Sorry you lose! the word was #{secret_word}"
    end

    def self.render_board game_board
      puts "\e[H\e[2J"
      game_board.each {|char| print "#{char} "}
      puts
    end

    def self.render_missed_words missed_words
      puts
      puts "Incorrect Letter: #{ missed_words.join(", ") }"
    end

    def self.render_guess_count guess_count
      puts  "Chances left: #{10-guess_count}"
    end

    def self.get_guess
      puts
      puts "Enter guess: "
      input = gets.chomp
    end
  end
end

game = Hangman::Game.new
game.play!
