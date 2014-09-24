require 'game.rb'

describe Game do
	before(:each) {@game = Game.new}
	

	it 'should greet you when the game is opened' do
		expect{Game.new}.to output("Let's play Battleships!\n").to_stdout
	end

	it 'should request player\'s name' do
		expect{@game.ask_name}.to output("Please enter your name:\n").to_stdout
	end

	it 'should get a name input' do
		@game.ask_name
		@game.name = "Sean"
		expect(@game.name).to eq("Sean")
	end
	# it 'should receive a name input from player' do
	# 	expect{@game.ask_name}.to 
	# end

end