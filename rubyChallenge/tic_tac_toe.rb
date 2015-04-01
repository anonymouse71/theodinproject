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
  end
end

b = TicTacToe::Board.new
e = TicTacToe::Player.new "ed", "x"
p b.grid
