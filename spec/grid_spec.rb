
require 'grid'

describe Grid do

	let(:grid) {Grid.new}
	let(:ship) {double :ship, body: ['S','S','S'], size: 3}

	it 'should create a 10 by 10 array full of ~ signs when created' do
		expect(grid.grid[3][5]).to eq('~')  
	end

	# it "should know what ships need to be placed on the grid" do
	# 	expect(grid.received_ships).to eq []
	# 	grid.receive(ship)
	# 	expect(grid.received_ships).to eq [ship]
	# end

	it 'should be able to place a ship on the grid horizontally' do
		grid.place_ship_horizontally(ship, 4, 6)
		expect(grid.grid[3][5]).to eq('S')
		expect(grid.grid[3][6]).to eq('S')
		expect(grid.grid[3][7]).to eq('S')
	end

	it 'should be able to place a ship on the grid vertically' do
		grid.place_ship_vertically(ship, 4, 6)
		expect(grid.grid[3][5]).to eq('S')
		expect(grid.grid[4][5]).to eq('S')
		expect(grid.grid[5][5]).to eq('S')
	end

	it 'should not be able to place a ship horizontally if too long' do
		expect{grid.place_ship_horizontally(ship, 9, 9)}.to raise_error("Cannot place here because there is not enough space.")
	end

	it 'should not be able to place a ship vertically if too long' do
		expect{grid.place_ship_vertically(ship, 9, 9)}.to raise_error("Cannot place here because there is not enough space.")
	end

	it 'should not be able to place a ship horizontally if there is something there' do
		grid.place_ship_horizontally(ship, 3, 5)
		expect{grid.place_ship_horizontally(ship, 3, 4)}.to raise_error("Cannot place here because there is a ship in the way.")
	end

	it 'should not be able to place a ship vertically if there is something there' do
		grid.place_ship_vertically(ship, 3, 5)
		expect{grid.place_ship_vertically(ship, 4, 5)}.to raise_error("Cannot place here because there is a ship in the way.")
	end

	it 'should be able to take a new value for the size of the grid' do
		bigger_grid = Grid.new(grid_size: 20)
		expect(bigger_grid.grid[19][19]).to eq ('~')
	end	
end