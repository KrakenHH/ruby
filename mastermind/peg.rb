class Peg
  attr_accessor :color

  def initialize(rand = false, color_choice = nil)
    if rand
      @color = rand_color_creator
    else
      @color = color_choice.downcase
    end
  end

  def rand_color_creator

    rand_num = rand(6)

    return 'r' if rand_num == 0
    return 'y' if rand_num == 1
    return 'g' if rand_num == 2
    return 'b' if rand_num == 3
    return 'o' if rand_num == 4
    return 'p' if rand_num == 5

  end



end