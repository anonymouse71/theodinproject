require 'yaml'

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
      return save_game! if user_input == ":w"
      if @secret_word.include?(user_input)
        char = @secret_word.split("")
        result = char.each_index.select {|index| char[index] == user_input }
        result.each {|index| @board[index]= user_input}
      else
        @missed_words << user_input
        @guess_count +=1
      end
    end

    def play!
      View.greeting
      until @guess_count > 9
        return View.congratulations! if @board.none?{|char| char  == "_"}
        View.render_board @board
        puts @secret_word
        View.render_missed_words @missed_words
        View.render_guess_count @guess_count
        guess!
      end
      View.game_over! @secret_word
    end

    def save_game!
      View.save
      Dir.mkdir 'game_data' unless Dir.exist? 'game_data'
      filename = 'game_data/data.yaml'
      File.open(filename,'w'){|file| file.puts YAML.dump self}
      exit
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
      puts "\e[H\e[2J"
      puts "Ding Ding! We have a winner! Thanks for playing..."
      exit
    end

    def self.game_over! secret_word
      puts "Sorry you lose! the word was #{secret_word}"
    end

    def self.save
      puts "\e[H\e[2J"
      puts "Game has been saved. Thanks!"
    end

    def self.render_board game_board
      puts "\e[H\e[2J"
      puts "You can save the game state by typing ':w'."
      puts
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
