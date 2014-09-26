require 'input_manager.rb'

describe InputManager do

	let(:input){InputManager.new}
	let(:ship_name) {:submarine}
	
	it 'should greet you when the game is opened' do
		expect{input.greeter}.to output("Let's play Battleships!\n").to_stdout
	end

	it 'should request player\'s name' do
		expect{input.ask_name}.to output("Please enter your name:\n").to_stdout
	end

	it 'should get a name input' do
		expect(input.get_name.class).to eq(String)
	end 
    
    it 'should ask what direction to place their ship' do
		expect{input.ask_direction(ship_name)}.to output("Please enter the direction to place your #{ship_name} (H or V):\n").to_stdout
	end

    it 'should ask the row to place their ship' do
		expect{input.ask_row(ship_name)}.to output("Please enter the row to place your #{ship_name}:\n").to_stdout
	end

	it 'should ask for shooting row' do
		expect{input.ask_shot_row}.to output("Please enter a row to shoot\n").to_stdout
	end

	it 'should ask for shooting column' do
		expect{input.ask_shot_col}.to output("Please enter a column to shoot\n").to_stdout
	end
end