require_relative '../lib/game.rb'

describe Game do 

  let(:game) {Game.new}

  describe "#initialize" do
    it "assigns player objects to the red_player and black_player readers" do
      expect(game).to respond_to(:red_player)
      expect(game).to respond_to(:black_player)
      expect(game).to respond_to(:board)
    end
  end

  describe "#get_player_name" do
    it "gets the name of a player of a specific color" do
      expect(game.get_player_name("red")).to be_a(String)
    end
  end

  describe "#create_red_player" do
    it "returns the red player object" do
      expect(game.create_red_player).to be_a(Player)
    end
  end

  describe "#create_black_player" do
    it "returns the black player object" do
      expect(game.create_black_player).to be_a(Player)
    end
  end

  describe "#solicit_move(player)" do
    it "gets the move (integer number) from the designated player" do
      expect(game.solicit_move(game.red_player)).to be_a(Integer)
    end
  end

  describe "#run" do

  end

end