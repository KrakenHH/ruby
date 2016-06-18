class Node

  attr_accessor :left_child, :right_child, :value


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

  def breadth_first_search(search_value)
    queue = []
    node = @master_node
    return node if node.value == search_value
   
    queue << @master_node

      until queue.empty?

        queue_node = queue.shift

        unless queue_node.left_child.nil?
          current_node = queue_node.left_child 
          return current_node if current_node.value == search_value 
          queue << current_node
        end
        unless queue_node.right_child.nil?
          current_node = queue_node.right_child
          return current_node if current_node.value == search_value
          queue << current_node
        end
      end
  
  end

  def depth_first_search(search_value)

    stack = []
    node = @master_node
    stack << node
    current_node = @master_node
    current_node if node.value = search_value

    while 1

      until current_node.left_child.nil?
        current_node = current_node.left_child
        return current_node if current_node.value = search_value
        stack << current_node
      end

      loop do
        current_node = stack.pop
        if current_node.right_child.nil? == false
          current_node = current_node.right_child 
          return current_node if current_node.value == search_value
          stack << current_node
          break
        end

      end 

    end

  end

  def dfs_rec(search_value, compare_node = @master_node) #not my original code

    return compare_node if compare_node.value == search_value
    a = dfs_rec(search_value, compare_node.left_child) if compare_node.left_child
    return a if a
    b = dfs_rec(value, compare_node.right) if compare_node.right
    return b if breadth_first_search
    nil

  end


end




my_nodes = Node.new(0)

nodes = my_nodes.build_tree([7,3,1,0,2,6,4,5,12,9,8,11,10,13,15,14])

puts nodes[4]
puts my_nodes.dfs_rec(2)








