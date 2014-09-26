
require 'grid'

describe Grid do

	let(:grid) {Grid.new}
	let(:ship) {double :ship, body: ['S','S','S'], size: 3, start_row: 3, start_col: 5}
	let(:ship_misplaced){double :ship, body: ['S','S','S'], size: 3, start_row: 9, start_col: 9}

	it 'should create a 10 by 10 array full of ~ signs when created' do
		expect(grid.grid[3][5]).to eq('~')  
	end

	# it "should know what ships need to be placed on the grid" do
	# 	expect(grid.received_ships).to eq []
	# 	grid.receive(ship)
	# 	expect(grid.received_ships).to eq [ship]
	# end

	it 'should be able to place a ship on the grid horizontally' do
		grid.place_ship_horizontally(ship)
		expect(grid.grid[3][5]).to eq('S')
		expect(grid.grid[3][6]).to eq('S')
		expect(grid.grid[3][7]).to eq('S')
	end

	it 'should be able to place a ship on the grid vertically' do
		grid.place_ship_vertically(ship)
		expect(grid.grid[3][5]).to eq('S')
		expect(grid.grid[4][5]).to eq('S')
		expect(grid.grid[5][5]).to eq('S')
	end

	it 'should not be able to place a ship horizontally if too long' do
		expect{grid.place_ship_horizontally(ship_misplaced)}.to raise_error("Cannot place here because there is not enough space.")
	end

	it 'should not be able to place a ship vertically if too long' do
		expect{grid.place_ship_vertically(ship_misplaced)}.to raise_error("Cannot place here because there is not enough space.")
	end

	it 'should not be able to place a ship horizontally if there is something there' do
		grid.place_ship_horizontally(ship)
		expect{grid.place_ship_horizontally(ship)}.to raise_error("Cannot place here because there is a ship in the way.")
	end

	it 'should not be able to place a ship vertically if there is something there' do
		grid.place_ship_vertically(ship)
		expect{grid.place_ship_vertically(ship)}.to raise_error("Cannot place here because there is a ship in the way.")
	end

	it 'should be able to take a new value for the size of the grid' do
		bigger_grid = Grid.new(grid_size: 20)
		expect(bigger_grid.grid[19][19]).to eq ('~')
	end	

	it 'should know its grid size' do
		expect(grid.grid_size).to eq(10)
	end

	it "should change if it receives a missile" do
		expect{grid.received_shot(2,3)}.to change{grid.grid[2][3]}
	end

	it "should change to a * if a ship is hit" do
		grid.place_ship_horizontally(ship)
		expect{grid.received_shot(3,6)}.to change{grid.grid[3][6]}.to eq('*')
	end

	it "should change to an o if it hits nothing" do
		expect{grid.received_shot(2,3)}.to change{grid.grid[2][3]}.to eq('o')
	end

	it "should know if a cell is empty" do
		expect(grid.empty?(2,3)).to eq(true)
	end

	it 'should raise an error if missile is fired a previously selected square' do
		grid.received_shot(2,3)
		expect{grid.received_shot(2,3)}.to raise_error("You have already been here.")
	end

	it 'should know how many squares are taken up by ships' do
		grid.place_ship_horizontally(ship)
		expect(grid.ship_square_count('~')).to eq(97)
	end
end