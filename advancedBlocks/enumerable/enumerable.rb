module Enumerable

  def my_each
    for element in self
      yield(element)
    end
    self
  end

  def my_each_with_index
    for n in 0...self.length
      yield(self[n],n)
    end
  self
  end

  def my_select
    newArr = []
    for element in self
      if yield(element)
        newArr << element
      end
    end
    newArr
  end

  def my_all?
    checker = true
    for n in 0...self.length
      if yield(self[n]) != true
        checker = false
      end
    end
    checker
  end
  
  def my_any?
    checker = false
    for n in 0...self.length
      if yield(self[n]) == true
        checker = true
      end
    end
    checker
  end

  def my_none?
    checker = true
    for n in 0...self.length
      if yield(self[n]) == true
        checker = false
      end
    end
    checker
  end

  def my_count
    count = 0
    for element in self
      count += 1
    end
    count
  end

  def my_map(some_proc = nil)
    newArr = []
    if some_proc != nil
      for i in 0...self.length
        newArr << some_proc.call(self[i])
      end
    else
      for i in 0...self.length
        newArr << yield(self[i])
      end
    end
    newArr
  end


  def my_inject
    total = self[0]
    for i in 1...self.length
      total = yield(total,self[i])
    end
    total
  end

end

  def multiply_els(arr)
    return arr.my_inject {|total,num| num*total}
  end

