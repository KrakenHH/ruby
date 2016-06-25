require_relative '../lib/player.rb'


describe Player do
  describe '#initalize' do

    let(:bob) { Player.new("bob", "red") }

    it "gives a player a name" do
      expect(bob.name).to eql("bob")
    end

    it "gives a player a color" do
      expect(bob.color).to eql("red")
    end

  end




  
end