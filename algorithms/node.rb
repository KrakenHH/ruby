class Node

  attr_accessor :left_child, :right_child, :parent, :value


  def initialize(value)
    @value = value
  end

  def build_tree(arr)

    @master_node = ''
    space_keeper = ''
    nodes = []
 
    arr.each_with_index do |ele, index|
      new_node = Node.new(ele)
      nodes << new_node
      @master_node =  new_node if index == 0

      if index != 0
        node_pos = @master_node
        l_or_r = ''
        current_pos = ''
        while node_pos != nil
          if new_node.value < node_pos.value
            current_pos = node_pos
            l_or_r = 'l'
            node_pos = node_pos.left_child
          else
            current_pos = node_pos
            l_or_r = 'r'
            node_pos = node_pos.right_child
          end
        end
        current_pos.left_child = new_node if l_or_r == 'l'
        current_pos.right_child = new_node if l_or_r == 'r'
      end
    end
    nodes
  end

end


my_nodes = Node.new(0)

nodes = my_nodes.build_tree([3,8,6,7,4,0,2])


