require_relative "../lib/string_calculator"
describe StringCalculator do

  describe ".add" do
    context "given '4'" do
      it "returns 4" do
        expect(StringCalculator.add("4")).to eql(4)
      end
    end

    context "given '10'" do
      it "returns 10" do
        expect(StringCalculator.add("10")).to eql(10)
      end
    end

    context "given '33,402,13'" do
      it "returns 448" do
        expect(StringCalculator.add("33,402,13")).to eql(448)
      end
    end
  end
end