# Build a tic-tac-toe game on the command line where two human players can play against each other and the board is displayed in between turns.

module TicTacToe
  class Cell
    attr_accessor :value
    def initialize value = ""
      @value = value
    end
  end

  class Player
    attr_reader :color, :name
    def initialize input
     @color = input.fetch(:color) 
     @name = input.fetch(:name)
    end
  end

  class Board
    attr_reader :grid
    def initialize input = {}
      @grid = input.fetch(:grid, default_grid)
    end

    def get_cell x,y
      grid[x][y]
    end

    private
    def default_grid
      Array.new(3){ Array.new(3){ Cell.new } }
    end
  end
end

