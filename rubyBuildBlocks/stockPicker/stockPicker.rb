def stock_picker(stocks)

	max_difference = 0

	for n in 0..stocks.length-1

		differences = []

		for z in 0...n
			differences << (stocks[n] - stocks[z])
		end

		

		unless differences.max.nil?

			if differences.max > max_difference

				max_difference = differences.max
			end
		end

	end

	return max_difference

end



puts stock_picker([17,3,6,9,15,8,6,1,10])






