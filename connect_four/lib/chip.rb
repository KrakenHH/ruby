class Chip
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def unicode_convert
    return "\u26AB" if color == "black"
    return "\u26AA" if color == "red"
  end


end