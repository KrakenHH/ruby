class Book

attr_accessor :name

def title=(name)

	bad_words = ["the","a","an","for","and","nor","but","or","yet","so","in","of"]

	word_arr = name.split(" ")

	word_arr.each do |word|

		if bad_words.include?(word) == false
		word.capitalize!
		end


	end

	word_arr.first.capitalize!

	@name = word_arr.join(" ")


end

def title
	return @name
end

end

xa = Book.new

xa.title = "the boobies and apples and titties"
puts xa.title