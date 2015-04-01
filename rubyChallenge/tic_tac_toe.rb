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
        return true if winning_values.include?(rows.join)
      end
      false
    end
    def winning_positions
      grid
      grid.transpose
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

b = TicTacToe::Board.new
e = TicTacToe::Player.new "ed", "x"
m = TicTacToe::Player.new "mel", "o"
b.print_board
p b.winner?
