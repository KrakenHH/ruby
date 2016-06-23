require_relative '../lib/player.rb'

describe Player do 

  before do
    @subject = Player.new("Bob", " X ")
  end

  describe "#initialize" do
    it "creates  anew player that has a :name value and a :marker value" do
      expect(@subject).to respond_to(:name)
      expect(@subject).to respond_to(:marker)
    end

    it "raises an error when initialized without arguements" do
      expect { Player.new }.to raise_error(ArgumentError)
    end
  end

  describe '#name' do
    it "returns the player's name" do
      expect(Player.new('Dalton',' O ').name).to eql('Dalton')
    end
  end

  describe '#marker' do
    it "returns the player's marker" do
      expect(@subject.marker).to eql(' X ')
    end
  end

end