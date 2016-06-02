def substrings(words, dictionary)

 	histogram = Hash.new(0)

	dictionary.each do |dic_word|

		words.gsub(dic_word) do |x|

			histogram[x] +=1
		end
	end

	return histogram
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("below", dictionary)


