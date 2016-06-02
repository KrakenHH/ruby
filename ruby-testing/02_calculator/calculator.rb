def add(x,y)
	return x+y
end


def subtract(num1,num2)
	return num1-num2
end

def sum(ray)
	total = 0
	ray.each do |ele|
		total += ele
	end
	return total
end

def multiply (x,*y)
	total = 0
	y.each do |ele|
		if total == 0
		total += x*ele
		else
			total *= ele
		end
	end
	return total
end

def power(num1,num2)
	return num1**num2
end

def factorial(num)
	total = 1
	if num == 0
		return 1
	else
	for i in 1..num
		total *= i
	end
	end
	return total
end
