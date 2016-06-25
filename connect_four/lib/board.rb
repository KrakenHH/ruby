class Board
  attr_reader :grid

  def initialize
    @grid = create_grid
  end

  def create_grid
    Array.new(6) { Array.new(7) { ' ' } }
  end

  def get_grid_coordinate(x, y)
    flattened_grid  = grid.flatten
    flattened_grid[xy_coord_to_flatten_coord(x,y)]
  end

  def set_grid_coordinate(x, y, value)
    flattened_grid = grid.flatten
    flattened_grid[xy_coord_to_flatten_coord(x,y)] = value
    modified_arr = []
    while ! flattened_grid.empty?
      modified_arr << flattened_grid.slice!(0..6)
    end
    @grid = modified_arr
  end

  def display_board
    puts " 1 2 3 4 5 6 7 "
    grid.each do |row|
      row.each { |space| print "|#{space == ' ' ? space : "Z"}" }
      print "|\n"
    end
    print "---------------"
  end

  def xy_coord_to_flatten_coord(x,y)
    x+(5-y)*7
  end

  def victory?
    return true if diag_victory?
    return true if horizontal_victory?
    return true if vertical_victory?
    false
  end

  def diag_victory?
    flat_grid = grid.flatten
    arrays = []
    [*0..3, *7..10, *14..17].each do |x|
      diag_array = []
      4.times { |num| diag_array  << flat_grid[x + (num)*8] }
      arrays << diag_array
    end
    [*3..6, *10..13, *14..20].each do |x|
      diag_array = []
      4.times { |num| diag_array  << flat_grid[x + (num)*6] }
      arrays << diag_array
    end
    arrays.any? { |arr| !arr.include?(' ') }
  end

  def horizontal_victory?
    grid.each do |row|
      row_string = row.join
      return true if row_string =~ /\S\S\S\S/
    end
    false
  end

  def vertical_victory?
    flat_grid = grid.flatten
    strings = []

    (0..6).each do |n|
      string = ""
      (0..5).each { |z| string << flat_grid[7*z+n]} 
      strings << string
    end
    strings.each { |string| return true if string =~ /\S\S\S\S/ }
    false

  end

end

