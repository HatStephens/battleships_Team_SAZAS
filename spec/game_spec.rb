require 'game.rb'
require 'ships.rb'

describe Game do
	let(:game){Game.new}
	let(:input){InputManager.new}
	let(:ship){Ship.submarine}

	let(:ship_loop){double :ship_loop, :name => anything, :direction => anything}

	it 'should have a InputManager' do
		expect(game.input_manager).not_to be(nil)  
	end

	it 'should greet you when the game is opened' do
		expect{input.start_message}.to output("Let's play Battleships!\n").to_stdout
		game.start_message
	end

	it 'should get the name and create a player' do
		
	end

	# it 'should request player\'s name' do
	# 	expect{game.ask_name}.to output("Please enter your name:\n").to_stdout
	# end

	# it 'should get a name input' do
	# 	expect(game.get_name.class).to eq(String)
	# end


	it 'should create an array with each ship in it' do
		expect{game.get_ships}.to change{game.ships.count}.by(5)
	end

	it 'should ask what direction to place their ship' do
		expect{game.ask_direction(ship.name)}.to output("Please enter the direction to place your submarine (H or V):\n").to_stdout
	end

	it 'should get the direction entered' do
		expect(game.get_direction(ship).class).to eq(String)
	end

	it 'should loop ships and get their initial positions' do
		game.get_ships
		expect(game.get_direction(ship_loop)).to be_call.exactly(5).times
		allow(ship_loop).to receive(:name)
		allow(ship_loop).to receive(:direction).with("h")
		game.get_ships_locations
	end



end