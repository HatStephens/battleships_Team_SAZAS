
require 'grid'

describe Grid do

	let(:grid) {Grid.new}
	let(:ship) {double :ship}

	it 'should create a 10 by 10 array full of + signs when created' do
		expect(grid.grid[3][5]).to eq('+')  
	end

	# it "should know what ships need to be placed on the grid" do
	# 	expect(grid.received_ships).to eq []
	# 	grid.receive(ship)
	# 	expect(grid.received_ships).to eq [ship]
	# end

	it 'should be able to place a ship on the grid horizontally' do
		allow(ship).to receive(:body).and_return(['S','S','S'])
		allow(ship).to receive(:size).and_return(3)
		grid.place_ship_horizontally(ship, 4, 6)
		expect(grid.grid[3][5]).to eq('S')
		expect(grid.grid[3][6]).to eq('S')
		expect(grid.grid[3][7]).to eq('S')
	end

	
end