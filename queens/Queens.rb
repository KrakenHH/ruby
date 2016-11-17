#Queens problem in ruby

#how can I put x number of queens on an x by x board so that none of them can take eachother


class QueensProblem

  attr_reader :board

  def initialize(dimension)
    @board = Array.new(dimension) {Array.new(dimension, '*')}
    @dimension = dimension
  end

  def to_s
    total_string = ''
    board.each do |row|
      total_string += row.join(' ') + "\n"
    end
    total_string
  end

  def isValidPlace(row, col)
    board.each_with_index do |r, row_num|
      r.each_with_index do |space, column_num|
        if board[row_num][column_num] == 'Q'
          if row_num == row || column_num == col || ((row-row_num).abs == (col-column_num).abs)
            return false
          end
        end
      end
    end
    true
  end

  def solve(row_num, column_num)

    if row_num > board.length - 1
      puts to_s + "\n"
    end

    while column_num < board.length
      if isValidPlace(row_num,column_num)
        @board[row_num][column_num] = 'Q'
        return solve(row_num + 1, 0)
      else
        column_num += 1
      end
    end

    (0...board.length).each do |num|
      if board[row_num-1][num] == 'Q'
        @board[row_num-1][num] = '*'
        return solve(row_num-1,num + 1)
      end
    end
  end
end


puts "please enter board size >= 4"
board_dimension = gets.chomp()
q = QueensProblem.new(board_dimension.to_i)
q.solve(0,0)
#puts q
#puts q.isValidPlace(0,0)
