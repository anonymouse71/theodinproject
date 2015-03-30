require 'spec_helper'

module TicTacToe
  describe Cell do
    context "#initialize" do
      it "is initialized with a value of '' by default" do
        cell = Cell.new
        expect(cell.value).to eq("")
      end

      it "can be initialized with the value of 'X'" do
        cell = Cell.new("X")
        expect(cell.value).to eq("X")
      end
    end
  end

  describe Player do
    context "#initialize" do
      it "should raise an error if initialized with {}" do
        expect{ Player.new({}) }.to raise_error
      end

      it "does not raise an error when initialized with a valid input hash" do
        input = {color: "X", name:"Eddie"}
        expect{ Player.new(input)}.to_not raise_error 
      end
    end

    context "#color" do
      it "returns the correct color" do
        input = {color: "X", name:"Eddie"}
        player = Player.new input
        expect(player.color).to eq("X")
      end
    end

    context "#name" do
      it "returns the correct name" do
        input = {color: "X", name:"Eddie"}
        player = Player.new input
        expect(player.name).to eq("Eddie")
      end
    end
  end

  describe Board do
    context "#initialize" do 
      it "initialized the board with a grid" do
        expect { Board.new(grid: "grid")}.to_not raise_error
      end

      it "sets a grid with 3 rows by default" do
        board = Board.new
        expect(board.grid.size).to eq(3)
      end

      it "creates 3 items for each row by default" do
        board = Board.new
        board.grid.each do |row|
          expect(row.size).to eq(3)
        end
      end
    end

    context "#grid" do
      it "returns the grid" do
        board = Board.new(grid: "blah")
        expect(board.grid).to eq("blah")
      end
    end

    context "#get_cell" do
      it "returns cell based off x,y coordinates" do
        grid = [["", "", ""],["", "", "ed"],["", "", ""]]
        board = Board.new(grid: grid)
        expect(board.get_cell(1,2)).to eq("ed")
      end
    end
  end

end
