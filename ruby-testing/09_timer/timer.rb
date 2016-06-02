class Timer

attr_accessor :seconds

def initialize
	@seconds = 0
end

def stringer(num)
	if num < 10
		return "0#{num}"
	else
		return "#{num}"
	end
end

def time_string
	if @seconds == 0
		return "00:00:00"
	else
		@mins = @seconds / 60
		@seconds = @seconds % 60
		@hours = @mins / 60
		@mins = @mins % 60

		num_arr = []
		
		num_arr << stringer(@hours)
		num_arr << stringer(@mins)
		num_arr << stringer(@seconds)

		@time_string = num_arr.join(":")
	end

end

end

#test = Timer.new
#test.seconds = 500
#puts test.time_string
