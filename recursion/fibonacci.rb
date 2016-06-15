def fibs(num)

  fib_sequence = [0,1]
  sequence_total = 0

  2.upto(num) do |index|
    sequence_total = fib_sequence[index-1] +fib_sequence[index-2]
    fib_sequence << sequence_total
  end
  fib_sequence  

end

def fibs_rec(n)
  return 0 if n == 0
  return 1 if n == 1
  return fibs_rec(n-1) + fibs_rec(n-2)
end



0.upto(10) { |num| puts fibs_rec(num)}