class Game

  require_relative 'board'
  require_relative 'player'

  attr_reader :red_player, :black_player, :board

  def initialize
    @red_player = create_red_player
    @black_player = create_black_player
    @board = Board.new
  end

  def get_player_name(color)
    puts "#{color} player, what is your name?"
    gets.chomp
  end

  def create_red_player
    Player.new(get_player_name("Red"), "red")
  end

  def create_black_player
    Player.new(get_player_name("Black"), "Black")
  end

  def solicit_move(player)
    puts "#{player.name}, which column would you like to drop your chip? Please select 1-7"
    gets.chomp.strip.to_i
  end

  def run
    loop do
      board.display_board
      board.drop_chip(solicit_move(red_player), "red")
      if board.victory?
        board.display_board
        puts "#{red_player.name}, you win!"
        break
      end
      board.display_board
      board.drop_chip(solicit_move(black_player), "black")
      if board.victory?
        board.display_board
        puts "#{black_player.name}, you win!"
        break
      end
      board.display_board
    end
  end


end

g = Game.new
g.run


