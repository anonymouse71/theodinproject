module Hangman
  class Game
    attr_reader :board
    def initialize
      @file = File.open("5desk.txt", "r"){|file| file.read}
      @valid_words = get_valid_words! @file
      @guess_count = 0
      @board = Array.new(secret_word.length){"_"}
      @missed_words = []
    end

    def get_valid_words! file
      file.split.select {|word| word.length.between?(5,13)}
    end

    def secret_word
      @valid_words.sample
    end

    def guess
      @guess_count += 1
      user_input = View.get_guess
    end

    def play!
      View.greeting
      until @guess_count > 9
        View.render_board @board
        guess
      end
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

    def self.render_board game_board
      game_board.each {|char| print "#{char} "}
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
