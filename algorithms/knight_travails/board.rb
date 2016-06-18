class Board

  require_relative 'move_tree_node.rb'

  def initialize
    create_board

  my_pos = @my_board[2][3]
  my_pos = 'test'
  @my_board.reverse_each { |row| puts row.inspect}
  end


  def create_board

    @my_board = []

    8.times { @my_board << [] }
    @my_board.each { |row| 8.times { row << '' } }
  

  end



  def generate_possible_moves
      @possible_moves = { up_left_wide: [-2,1], up_left_skinny: [-1,2], up_right_wide: [2,1], up_right_skinny: [1,2],
                       down_left_wide: [-2,-1], down_left_skinny: [-1,-2], down_right_wide: [2,-1], down_right_skinny: [1,-2] } 
  end

  def generate_move_tree(coords_arr)

    @master_node = MoveTreeNode.new((coords_arr))
    nodes = []
    nodes << @master_node

    8.times do
      new_nodes = []
      nodes.each do |node|
        @possible_moves.each do |key, value|
          if (0..7).include?(node.position[0]+value[0]) && (0..7).include?(node.position[1]+value[1])
            new_node = MoveTreeNode.new([node.position[0]+value[0], node.position[1]+value[1]])
            node.children << new_node
            new_node.parent = node
            new_nodes << new_node
          end
        end
      end
      nodes = new_nodes
    end
  end

  def find_shortest_route(start_pos_coords, search_position_coords)
    generate_move_tree(start_pos_coords)
    queue = []
    node = @master_node
    return node if node.position == search_position_coords

    queue << node

    until queue.empty?
      queue_node = queue.shift
      until queue_node.children.empty?
        current_node = queue_node.children.shift
        return current_node if current_node.position == search_position_coords
        queue << current_node
      end
    end
  end

  def get_route_path(node)

    arr = []
    arr <<  node.position.inspect


    until node.parent == nil
      arr << node.parent.position.inspect

      node = node.parent
    end

    puts "You made it in #{arr.size-1} moves! Here is the path:"
    puts arr.reverse.inspect


  end
end




new_board = Board.new
new_board.generate_possible_moves
new_board.create_board
puts new_board.get_route_path(new_board.find_shortest_route([0,0],[1,2]))

