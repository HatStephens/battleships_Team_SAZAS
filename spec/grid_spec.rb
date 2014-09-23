
require 'grid'

describe Grid do

	let(:grid) {Grid.new}
	let(:ship) {double :ship}

	it 'should create a 10 by 10 array full of + signs when created' do
		expect(grid.display_grid[3][5]).to eq('+')  
	end

	it "should know what ships need to be placed on the grid" do
		expect(grid.received_ships).to eq []
		grid.receive(ship)
		expect(grid.received_ships).to eq [ship]
	end

	it 'should be able to place a ship on the grid' do

	end

	
end