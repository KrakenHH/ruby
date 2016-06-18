class MoveTreeNode

  attr_accessor :position, :children, :parent

  def initialize(coord_arr)

    @position = coord_arr
    @children = []

  end

end