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
end
