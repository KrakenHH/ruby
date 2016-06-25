require_relative '../lib/chip.rb'

describe Chip do 

  describe "#initialize" do
    let(:new_chip) { Chip.new("black") }

    it "gives chip a color" do
      expect(new_chip.color).to_not eql(nil)
    end
  end

  describe "#unicode_convert" do
    let(:black_chip) {Chip.new("black")}
    let(:red_chip) {Chip.new("red")}
    it "converts it's color into the appropriate unicode and returns this string" do
      expect(black_chip.unicode_convert).to eql("\u26AB")
      expect(red_chip.unicode_convert).to eql("\u26AA")
    end
  end


end