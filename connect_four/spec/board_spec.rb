require_relative '../lib/board.rb'


describe Board do
  let(:board) {Board.new}


  describe "#initialize" do

    it "creates the grid" do
      expect(board.grid).to be_instance_of(Array)
    end

    it "creates a grid with 6 rows" do
      expect(board.grid.size).to eql(6)
    end

    it "fills each row with 7 blanks" do
      board.grid.each do |row|
        expect(row.size).to eql(7)
      end
    end
  end

  describe "#get_grid_coordinate" do
    it "returns the correct grid coordinate" do
      expect(board.get_grid_coordinate(2,3)).to eql(board.grid[2][3])
    end
  end

  describe "#set_grid_coordinate" do
    it "sets the correct grid coordinate to the correct value" do
      board.set_grid_coordinate(1,3,"\u26AB")
      expect(board.get_grid_coordinate(1,3)).to eql("\u26AB")
    end
  end

  describe "#xy_coord_to_flatten_coord" do
    context "given an x,y coordinate value on a grid" do
      it "returns what that value would be on the flattened grid" do
        expect(board.xy_coord_to_flatten_coord(5,3)).to eql(19)
        expect(board.xy_coord_to_flatten_coord(3,4)).to eql(10)
      end
    end
  end

  describe "#diag_victory?" do
    it "returns true if there is a diagonal victory" do
      board.set_grid_coordinate(3,3,"X")
      board.set_grid_coordinate(4,2,"X")
      board.set_grid_coordinate(5,1,"X")
      board.set_grid_coordinate(6,0,"X")
      expect(board.diag_victory?).to be(true)
    end
    it "returns true if there is a diagonal victory" do
      board.set_grid_coordinate(0,3,"X")
      board.set_grid_coordinate(1,2,"X")
      board.set_grid_coordinate(2,1,"X")
      board.set_grid_coordinate(3,0,"X")
      expect(board.diag_victory?).to be(true)
    end
    it "returns true if there is a diagonal victory" do
      board.set_grid_coordinate(1,4,"X")
      board.set_grid_coordinate(2,3,"X")
      board.set_grid_coordinate(3,2,"X")
      board.set_grid_coordinate(4,1,"X")
      expect(board.diag_victory?).to be(true)
    end
   it "returns true if there is a diagonal victory" do
      board.set_grid_coordinate(5,4,"X")
      board.set_grid_coordinate(4,3,"X")
      board.set_grid_coordinate(3,2,"X")
      board.set_grid_coordinate(2,1,"X")
      expect(board.diag_victory?).to be(true)
    end
    it "returns false if there is no diagonal victory" do
      board.set_grid_coordinate(0,0,"X")
      board.set_grid_coordinate(1,0,"X")
      board.set_grid_coordinate(2,0,"X")
      board.set_grid_coordinate(3,0,"X")
      expect(board.diag_victory?).to be(false)
    end

  end

  describe "#horizontal_victory?" do
    it "returns true if there is a horizontal victory" do
      board.set_grid_coordinate(0,0,"X")
      board.set_grid_coordinate(1,0,"X")
      board.set_grid_coordinate(2,0,"X")
      board.set_grid_coordinate(3,0,"X")
      expect(board.horizontal_victory?).to be(true)
    end
    it "returns true if there is a horizontal victory" do
      board.set_grid_coordinate(2,2,"X")
      board.set_grid_coordinate(3,2,"X")
      board.set_grid_coordinate(4,2,"X")
      board.set_grid_coordinate(5,2,"X")
      expect(board.horizontal_victory?).to be(true)
    end
    it "returns true if there is a horizontal victory" do
      board.set_grid_coordinate(3,4,"X")
      board.set_grid_coordinate(4,4,"X")
      board.set_grid_coordinate(5,4,"X")
      board.set_grid_coordinate(6,4,"X")
      expect(board.horizontal_victory?).to be(true)
    end
   it "returns true if there is a horizontal victory" do
      board.set_grid_coordinate(1,5,"X")
      board.set_grid_coordinate(2,5,"X")
      board.set_grid_coordinate(3,5,"X")
      board.set_grid_coordinate(4,5,"X")
      expect(board.horizontal_victory?).to be(true)
    end
    it "returns false if there is no horizontal victory" do
      board.set_grid_coordinate(3,3,"X")
      board.set_grid_coordinate(4,0,"X")
      board.set_grid_coordinate(6,6,"X")
      board.set_grid_coordinate(3,0,"X")
      expect(board.horizontal_victory?).to be(false)
    end


  describe "#vertical_victory?" do
    it "returns true if there is a vertical victory" do
      board.set_grid_coordinate(0,0,"X")
      board.set_grid_coordinate(0,1,"X")
      board.set_grid_coordinate(0,2,"X")
      board.set_grid_coordinate(0,3,"X")
      expect(board.vertical_victory?).to be(true)
    end
    it "returns true if there is a vertical victory" do
      board.set_grid_coordinate(2,2,"X")
      board.set_grid_coordinate(2,3,"X")
      board.set_grid_coordinate(2,4,"X")
      board.set_grid_coordinate(2,5,"X")
      expect(board.vertical_victory?).to be(true)
    end
    it "returns true if there is a vertical victory" do
      board.set_grid_coordinate(4,2,"X")
      board.set_grid_coordinate(4,3,"X")
      board.set_grid_coordinate(4,4,"X")
      board.set_grid_coordinate(4,5,"X")
      expect(board.vertical_victory?).to be(true)
    end
   it "returns true if there is a vertical victory" do
      board.set_grid_coordinate(5,1,"X")
      board.set_grid_coordinate(5,2,"X")
      board.set_grid_coordinate(5,3,"X")
      board.set_grid_coordinate(5,4,"X")
      expect(board.vertical_victory?).to be(true)
    end
    it "returns false if there is no vertical victory" do
      board.set_grid_coordinate(3,3,"X")
      board.set_grid_coordinate(4,0,"X")
      board.set_grid_coordinate(6,6,"X")
      board.set_grid_coordinate(3,0,"X")
      expect(board.vertical_victory?).to be(false)
    end
  end
  
  end

end