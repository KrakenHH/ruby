class StringCalculator

  def self.add(input)
    if input.empty?
      0
    else
      nums = input.split(',')
      total = 0
      nums.each { |num| total += num.to_i}
      total
    end
  end
end