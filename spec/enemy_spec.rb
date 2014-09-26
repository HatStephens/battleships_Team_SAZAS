require 'enemy'

describe Enemy do

	let(:enemy){Enemy.new}
	let(:player){Player.new("Steve")}

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
		
		expect(enemy.actual_grid.ship_square_count('~')).to eq(85)
	end

	it 'should shoot a shot randomly' do
		enemy.enemy_shoot(player)
		expect(player.player_grid.ship_square_count('~')).to eq(99)
	end

	it 'should receive a shot' do
		expect(enemy.received_shot(2, 4)).to change{actual_grid[2][3]}
	end


end