
def echo(word)
	return word
end

def shout(word)
	return word.upcase
end

def repeat(word, z = 2)
	newWord = ("#{word} "*z)
	newWord = newWord[0..newWord.length-2]
	return newWord
end

def start_of_word(word, num)
	return word[0,num]
end

def first_word (words)
	words.split.first
end

def titleize(words)
	myArr = words.split
	myArr.each do |x|
		if x != "over" && x != "and" && x != "the"
			x.capitalize!
		end
		if myArr.first == "over" || myArr.first == "and" || myArr.first == "the"
			myArr.first.capitalize!
		end
	end
	return myArr.join(" ")
end



