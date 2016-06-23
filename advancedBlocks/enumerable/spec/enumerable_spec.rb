require_relative '../lib/enumerable.rb'

describe Enumerable do
  
  let(:arr) { [3,4,7,13,2,0] }  

  describe ".my_count" do
    it "returns the size of array" do
      expect(arr.my_count).to eql(6)
    end

    it "returns 0 if it's empty" do
      arr = []
      expect(arr.my_count).to eql(0)
    end

  end

  describe ".my_select" do
    context "when a bloc is given" do
      it "returns an array" do
        expect(arr.select { |ele| ele }).to be_instance_of(Array)
      end

      it "returns an array of values for which the condition is true" do
        expect(arr.select { |ele| ele > 2} ).to eql([3,4,7,13])
        expect(arr.select { |ele| ele == 555 } ).to eql([])
      end

    end
  end

  describe ".my_map" do
    it "returns an array of the values returned by the bloc" do
      expect(arr.my_map { |ele| ele*2 } ).to eql([6,8,14,26,4,0])
      expect(arr.my_map { |ele| ele - ele } ).to eql([0,0,0,0,0,0])
      expect(arr.my_map { |ele| "D" } ).to eql(["D","D","D","D","D","D"])
    end

    it "returns an array if called on an array with a bloc" do
      expect(arr.my_map { |ele| ele } ).to be_instance_of(Array)
    end

    it "answers to a proc" do
      my_proc = Proc.new { |x| x*10 }
      expect(arr.my_map(&my_proc)).to eql([30,40,70,130,20,0])
    end

  end

  describe ".my_none?" do
    it "returns true if the bloc evaluates to false for all elements" do
      expect(arr.my_none? { |ele| ele < 0} ).to eql(true)
      expect(arr.my_none? { |ele| ele.is_a?(Array)} ).to eql(true)
    end

    it "returns false if the bloc evaluates to true for any element" do
      expect(arr.my_none? { |ele| ele == 0} ).to eql(false)
      expect(arr.my_none? { |ele| ele.is_a?(Integer)} ).to eql(false)
    end

  end

  describe ".my_inject" do
    context "given an { element*total } bloc and an array of integers" do
      it "returns the product of all the integers" do
        expect(arr.my_inject { |tot,ele| tot*ele }).to eql(0)
        new_arr = [3,1,2,3,54]
        expect(new_arr.my_inject { |tot,ele| tot*ele }).to eql(972)
      end
    context "given an { element + total } bloc and an array of integers" do
      it "returns the sum of all the integers" do
        expect(arr.my_inject { |tot,ele| tot+ele }).to eql(29)
      end
    end
  end

  describe ".my_any?" do
    it "returns true if the bloc evaluates to true for any elements" do
      expect(arr.my_any? { |ele| ele == 0 }).to eql(true)
      expect(arr.my_any? { |ele| ele.is_a?(Integer) }).to eql(true)  
  
    end

    it "returns false if the bloc evaluates to false for all elements" do
      expect(arr.my_any? { |ele| ele.is_a?(Hash) }).to eql(false)
      expect(arr.my_any? { |ele| ele == "zip" }).to eql(false)

    end
  end

end

end