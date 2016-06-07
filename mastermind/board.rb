class Board

  require_relative 'peg'

  def initialize

    @turn_counter = 9
    feedback_pegs_create
    create_answer
    @answer_pegs.each { |x| puts x.color }
    create_empty_board
    while @turn_counter >= 0
      turn
      if victory?
        puts "YOU CRACKED THE CODE, YOU WIN!!!"
        break
      end
      puts "GAME OVER YOU LOSE" if @turn_counter == -1
    end
  end

  def turn
    puts "Which 4 pegs would you like to place? Use the first letters of the colors ((r)ed, (y)ellow, (g)reen, (b)lue, (o)range, or (p)urple) you would like to place seperated by spaces."
    choices = gets.chomp.split
    if choices.size > 4
      puts "\n\n\n***Error, you entered too many choices, try again with less choices.***".upcase
      turn
    elsif (choices.select { |x| x =~ /[^rygbop]/i }).empty? == false
      puts "\n\n\n***You have made an incorrect slections, please try again, and choose the correct letters.***".upcase
      turn
    elsif choices.any? { |x| x.length > 1}
      puts "\n\n\n***You must seperate your letter by spaces. Please try again.***".upcase
      turn
    else  
    choice_creator_inserter(choices)
    @turn_counter -= 1
    feedback_pegs_change
    show_board
    end
  end

  def choice_creator_inserter(choices)
    @choices = ['|',' ','|',' ','|',' ','|',' ','|']

      @choices[1] = Peg.new(false,choices[0])
      @choices[3] = Peg.new(false,choices[1])
      @choices[5] = Peg.new(false,choices[2])
      @choices[7] = Peg.new(false,choices[3])

      @rows[@turn_counter] = @choices
  
  end
 

  def show_board
    count = 0
    #print "\""
    #@answer_pegs.each { |x| print "|" + x.color}
    #puts "|\n"
    @rows.each do |row|

      if row.join.include? ' '
        puts row.join.inspect
        count += 1
      else
        puts "\"|#{row[1].color}|#{row[3].color}|#{row[5].color}|#{row[7].color}|\"" + " " + @feedback_pegs[count]
        count += 1
      end
    end

  end

  def feedback_pegs_create

    @feedback_pegs = [] 
    10.times { @feedback_pegs << [] }

  end

  def feedback_pegs_change

    for i in 0..9
      if @rows[i].join.include? ' '
        @feedback_pegs[i] = ''
      else
        @feedback_pegs[i] = feedback_giver(i)
      end
    end
  end

  def feedback_giver(row_num)

    blacks = 0
    whites = 0
    answer_pegs = @answer_pegs
    row_without_filler = @rows[row_num] - ['|', ' ']

    new_answer_pegs = []
    new_row_without_filler = []


    answer_pegs.each_with_index do |peg, index|
      if peg.color == row_without_filler[index].color
          blacks += 1
      else
        new_answer_pegs << peg
        new_row_without_filler << row_without_filler[index]
      end
    end

    if new_row_without_filler.size > 0 
      for i in 0...new_row_without_filler.size
        for n in 0...new_answer_pegs.size
          if new_answer_pegs[n].respond_to?(:color)
            if new_answer_pegs[n].color == new_row_without_filler[i].color
              new_answer_pegs[n] = ''
              whites += 1
              break
            end
          end
        end
      end
    end

    return "#{blacks} black(s), #{whites} white(s)"

  end

  def create_answer
    @answer_pegs = [Peg.new(true), Peg.new(true), Peg.new(true), Peg.new(true)]
  end

  def create_empty_board
    @rows = []
    10.times { @rows << ['|',' ','|',' ','|',' ','|',' ','|']}
  end

  def victory?

    rows = @rows[@turn_counter+1] - ['|',' ']

    if "#{rows[0].color}#{rows[1].color}#{rows[2].color}#{rows[3].color}" == "#{@answer_pegs[0].color}#{@answer_pegs[1].color}#{@answer_pegs[2].color}#{@answer_pegs[3].color}"
      return true
    else
      return false
    end

  end


end

b = Board.new