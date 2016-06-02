def bubble_sort(arr)

	sorted = false

	until sorted

		sorted = true
		for n in 0...arr.length		
			unless (n+1) == arr.length
				if arr[n+1] < arr[n]
					arr[n], arr[n+1] = arr[n+1], arr[n]
				end
			end
		end

		for n in 0...arr.length
			unless (n+1) == arr.length
				if arr[n] > arr[n+1]
					sorted = false
				end
			end
		end
	end
  arr.inspect
end
  
puts bubble_sort([4,8,251,20,785,31,45,218,463,12,4])


def bubble_sort_by(arr)

  sorted = false

  until sorted
  sorted = true
    for n in 0...arr.length   
      unless (n+1) == arr.length
        if yield(arr[n],arr[n+1]) > 0
          arr[n], arr[n+1] = arr[n+1], arr[n]
        end
      end
    end

    for n in 0...arr.length
      unless (n+1) == arr.length
        if yield(arr[n],arr[n+1]) > 0
          sorted = false
        end
      end
    end
  end
  arr.inspect
end


puts bubble_sort_by(["hi","hello","hey","bananna", "dinosaur", "apple", "bob", "dylan"]) { |left,right| left.length<=>right.length }




