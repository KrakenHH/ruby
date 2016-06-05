class Board

  require_relative 'player'

  def initialize 
    create_board
    prompt_names

    
    loop do
      p1_turn
      if victory?(@p1)
        show_board
        puts "#{@p1.name}, you WIN!!!!!!!"
        break
      end  
      p2_turn
      if victory?(@p2)
        show_board
        puts "#{@p2.name}, you WIN!!!!!!!"
        break
      end
    end 

  end




  def p1_turn(reduc = false)
    show_board
    puts "***TIME FOR A RETRY #{@p1.name} BECAUSE YOU SELECTED A FILLED SPOT***" if reduc
    puts "#{@p1.name}, where would you like to place your X, select using A1 through A3, B1 through B3 and C3 through C3"
    placement = gets.chomp.upcase
    alter_board(placement, 'X', @p1) 
  
  end

  def p2_turn(reduc = false)
    show_board
    puts "***TIME FOR A RETRY #{@p2.name} BECAUSE YOU SELECTED A FILLED SPOT***" if reduc
    puts "#{@p2.name}, where would you like to place your O, select using A1 through A3, B1 through B3 and C3 through C3"
    placement = gets.chomp.upcase
    alter_board(placement, 'O', @p2)

  end

  def alter_board(placement, x_o, player)
    coords = placement.split('')

    coords[1] = 0  if coords[1].to_i == 1
    coords[1] = 4 if coords[1].to_i == 3

    if coords.first == 'A'
      unless full?(@top_line[coords[1].to_i])
        @top_line[coords[1].to_i] =  " #{x_o} "
      else
        player == @p1 ? p1_turn(true) : p2_turn(true)
      end
    elsif coords.first == 'B'
      unless full?(@mid_line[coords[1].to_i])
        @mid_line[coords[1].to_i] = " #{x_o} "
      else
        player == @p1 ? p1_turn(true) : p2_turn(true)
      end
    else 
      unless full?(@bot_line[coords[1].to_i])
        @bot_line[coords[1].to_i] = " #{x_o} " unless full?(@bot_line[coords[1].to_i])
      else
        player == @p1 ? p1_turn(true) : p2_turn(true)
      end
    end
  end

  def full?(board_space)
    board_space != '   '
  end


  def show_board
    puts @top_line.join
    puts @seperator
    puts @mid_line.join
    puts @seperator
    puts @bot_line.join
  end

  private 

  def prompt_names
    puts "player 1, please enter your name"
    p1_name = gets.chomp
    @p1 = Player.new(p1_name," X ")
    puts "player 2, please enter you name"
    p2_name = gets.chomp
    @p2 = Player.new(p2_name," O ")
  end

  def create_board
    @seperator = "------------"
    @top_line = ['   ', '|', '   ', '|', '   ']
    @mid_line = ['   ', '|', '   ', '|', '   ']
    @bot_line = ['   ', '|', '   ', '|', '   ']
  end

  def victory?(player)
    if player == @p1
      token1 = ' X '
      token2 = ' O '
    else
      token1 = ' O '
      token2 = ' X '
    end

    if @top_line.include?('   ') == false && @top_line.include?(token2) == false
      return true
    elsif @mid_line.include?('   ') == false && @mid_line.include?(token2) == false
      return true
    elsif @bot_line.include?('   ') == false && @bot_line.include?(token2) == false
      return true
    end

    column_creator

    if @column1.include?('   ') == false && @column1.include?(token2) == false
      return true
    elsif @column2.include?('   ') == false && @column2.include?(token2) == false
      return true
    elsif @column3.include?('   ') == false && @column3.include?(token2) == false
      return true
    end

    diag_creator

    if @diag1.include?('   ') == false && @diag1.include?(token2) == false
      return true
    elsif @diag2.include?('   ') == false && @diag2.include?(token2) == false
      return true
    end
  end

  def column_creator
    @column1 = [@top_line[0],@mid_line[0],@bot_line[0]]
    @column2 = [@top_line[2],@mid_line[2],@bot_line[2]]
    @column3 = [@top_line[4],@mid_line[4],@bot_line[4]]
  end

  def diag_creator
    @diag1 = [@top_line[0],@mid_line[2],@bot_line[4]]
    @diag2 = [@top_line[4],@mid_line[2],@bot_line[0]]
  end
      
      


end

b = Board.new
