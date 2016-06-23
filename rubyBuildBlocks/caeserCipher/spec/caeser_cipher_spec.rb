require_relative '../lib/caeser_cipher.rb'

describe "#caeser_cipher" do

  it "shifts the letters in a word by the number given" do
    expect(caeser_cipher('dylan',5)).to eql('idqfs')
  end

  it "preserves white space" do
    expect(caeser_cipher("Hello there bob",1)).to eql("Ifmmp uifsf cpc")
  end

  context "given 'apple' and 5" do
    it "returns fuuqj" do
      expect(caeser_cipher('apple',5)).to eql('fuuqj')
    end
  end

  context "given word containing 'yxz' values" do
    it "crosses back to beggining of alphabet" do
      expect(caeser_cipher('xyz',4)).to eql('bcd')
    end
  end

  context "given capital capital and undercase letters" do
    it "retruns the answers with case intanct" do
      expect(caeser_cipher('QuALitY',2)).to eql('SwCNkvA')
    end
  end

end 

