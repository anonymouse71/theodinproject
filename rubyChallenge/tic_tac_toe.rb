module TicTacToe
  Player = Struct.new :name, :sym
  Cell = Struct.new :value
end

module TicTacToe
  class Board
    attr_reader :grid
    def initialize
      @grid = default_grid
    end

    def default_grid
      Array.new(3){ Array.new(3){ Cell.new("_")} }
    end

    def get_cell x,y
      grid[x][y]
    end

    def set_cell x,y,value
      get_cell(x,y).value = value
    end

    def print_board
      grid.each do |row|
        puts row.map {|cell| cell.value}.join
      end
    end

    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end

    def winner?
      winning_values = ["xxx", "ooo"]
      winning_positions.each do |rows|
        string = rows.map{|cell| cell.value}.join
        return true if winning_values.include?(string)
      end
      false
    end
    def winning_positions
      grid+
      grid.transpose+
      diagonals
    end

    def diagonals
      [
        [get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)],
        [get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)]
      ]
    end

    def draw?
      grid.flatten.all? {|cell| cell.value == "x"||"o" && cell.value != "_"}
    end
  end
end

module TicTacToe
  class Game
    attr_reader :board, :current_player, :other_player
    def initialize players
      @players = players
      @board = Board.new
      @current_player, @other_player = @players.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def make_move
      "#{current_player.name}: Enter a number from 1 and 9 to make your move."
    end

    def get_move move = gets.chomp
      player_coordinates(move)
    end

    def player_coordinates player_move
      maps = {
        "1"=> [0,0],
        "2"=> [0,1],
        "3"=> [0,2],
        "4"=> [1,0],
        "5"=> [1,1],
        "6"=> [1,2],
        "7"=> [2,0],
        "8"=> [2,1],
        "9"=> [2,2]
      }
      maps[player_move]
    end

    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return "Draw!" if board.game_over == :draw
    end

    def play
      puts "#{current_player.name} has been selected to go first."
      while true
        board.print_board
        puts
        puts make_move
        x,y = get_move
        board.set_cell(x,y, current_player.sym)
        if board.game_over
          puts game_over_message
          board.print_board
          exit
        else
          switch_players
        end
      end
    end
  end
end
e = TicTacToe::Player.new "ed", "x"
m = TicTacToe::Player.new "mel", "o"
players = [e,m]
game = TicTacToe::Game.new players
game.play
