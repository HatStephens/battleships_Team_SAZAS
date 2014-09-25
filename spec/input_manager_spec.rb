require 'input_manager'

describe InputManager do

	let(:input){InputManager.new}
	let(:ship){Ship.submarine}
	
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
		expect{input.ask_direction(ship.name)}.to output("Please enter the direction to place your submarine (H or V):\n").to_stdout
	end

    it 'should ask the row to place their ship' do
		expect{input.ask_row(ship.name)}.to output("Please enter the row to place your submarine:\n").to_stdout
	end
  
end