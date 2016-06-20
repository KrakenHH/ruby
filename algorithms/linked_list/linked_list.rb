class LinkedList

  require_relative 'node.rb'


  def append(value)
    new_node = Node.new(value)
    @master_node ||= new_node
    node = @master_node

    until node.next_node == nil
      node = node.next_node
    end

    node.next_node = new_node unless @master_node == new_node

  end

  def prepend(value)

    new_node = Node.new(value)

    if @master_node.nil?
      new_node = @master_node
      return
    else
      new_node.next_node = @master_node
      @master_node = new_node
    end

  end

  def size
    return 0 if @master_node.nil?
    counter = 1

    node = @master_node

    until node.next_node.nil?
      counter += 1
      node = node.next_node
    end
    counter

  end

  def head
    return @master_node unless @master_node.nil?
  end

  def tail
    return "doesn't exist" if @master_node.nil?
    node = @master_node
    until node.next_node.nil?
      node = node.next_node
    end
    node
  end

  def pop
    node = @master_node
    prev_node = nil

    until node.next_node.nil?
      prev_node = node
      node = node.next_node
    end
    prev_node.next_node = nil
    node
  end

  def contains?(search_value)
    node = @master_node
    return true if node.value == search_value
    until node.next_node == nil
      node = node.next_node
      return true if node.value == search_value
    end
    false

  end

  def find(search_value)
    index = 0
    node = @master_node
    return index if node.value == search_value
    until node.next_node == nil
      index += 1
      node = node.next_node
      return index if node.value == search_value
    end
    nil

  end

  def display_nodes

    node = @master_node

    until node.next_node == nil

       print node.value.to_s + " --> "
       node = node.next_node 
    end

    puts node.value.to_s

  end

end


my_list = LinkedList.new
my_list.append(2)
my_list.append(3)
my_list.append(4)
my_list.append(78)
my_list.append(60004)
my_list.append(777)
my_list.prepend(555)
my_list.prepend(333)

puts "size: " + my_list.size.to_s
puts "head node: " + my_list.head.value.to_s
puts "tail node: " + my_list.tail.value.to_s
puts "pop: " + my_list.pop.value.to_s
puts "pop: " + my_list.pop.value.to_s
puts "pop: " + my_list.pop.value.to_s
puts "size: " + my_list.size.to_s
puts "tail node: " + my_list.tail.value.to_s
puts "contains 3?: " + my_list.contains?(3).to_s
puts "contains 832?: " + my_list.contains?(832).to_s
puts "contains 777?: " + my_list.contains?(777).to_s
puts "find 3 index: " + my_list.find(3).to_s
puts "find 555 index: " + my_list.find(555).to_s
puts "find 777 index: " + my_list.find(777).inspect.to_s





