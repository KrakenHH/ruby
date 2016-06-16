def merge_sort(arr)
  if arr.size == 1
    return arr
  end

  slice_length = arr.size/2

  new_arr_b = arr[0...slice_length]
  new_arr_c = arr[slice_length...arr.size]

  a = merge_sort(new_arr_b)
  b = merge_sort(new_arr_c)
  c = []

  ia = a.size
  ib = b.size

  while ia >= 1 && ib >= 1
    if a.first < b.first
      c << a.first
      a.delete_at(0)
      ia -= 1
    else
      c << b.first
      b.delete_at(0)
      ib -= 1
    end
  end

  if ia == 0
    c = c + b
  else
    c = c + a
  end

end


puts merge_sort([1,2,34,3,12,2,4,5,6])


#Notes to self about recursion: always start with the base case and build up from there. It will work out. 
#When working through a case, imagine breaking down the case to it's little pieces and base case, then building it back up.