require_relative '../lib/chip.rb'

describe Chip do 

  describe "#initialize" do
    let(:new_chip) { Chip.new("black") }

    it "gives chip a color" do
      expect(new_chip.color).to_not eql(nil)

    end
  end



end