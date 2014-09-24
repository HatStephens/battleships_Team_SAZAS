require 'game.rb'
require 'ships.rb'

describe Game do
	let(:game){Game.new}
	let(:ship){Ship.submarine}
	

	it 'should greet you when the game is opened' do
		expect{game.start_message}.to output("Let's play Battleships!\n").to_stdout
	end

	it 'should request player\'s name' do
		expect{game.ask_name}.to output("Please enter your name:\n").to_stdout
	end

	it 'should get a name input' do
		expect(game.get_name.class).to eq(String)
	end

	it 'should create an array with each ship in it' do
		expect{game.get_ships}.to change{game.ships.count}.by(5)
	end

	it 'should ask what direction to place their ship' do
		expect{game.ask_direction(ship.name)}.to output("Please enter the direction to place your submarine (H or V):\n").to_stdout
	end

	it 'should get the direction entered' do
		expect(game.get_direction(ship).class).to eq(String)
	end


end