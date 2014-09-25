require 'enemy'

describe Enemy do

	let(:enemy){Enemy.new}

	it  'should store a score' do
		expect(enemy.score).to eq(0)
	end

	it 'should set up a new grid when created for us to place ships on' do
		expect(enemy.actual_grid.grid[3][5]).to eq('~')
	end

	it 'should set up a new grid when created for us to show the user on' do
		expect(enemy.displayed_grid.grid[3][5]).to eq('~')
	end

	it 'should place all ships onto the grid' do
		enemy.get_ships
		enemy.enemy_place_ships
		
		expect(enemy.actual_grid.ship_square_count).to eq(15)
	end

end