require 'input_manager'

describe InputManager do

	let(:input){InputManager.new}
	
	it 'should greet you when the game is opened' do
		expect{input.start_message}.to output("Let's play Battleships!\n").to_stdout
	end

	it 'should request player\'s name' do
		expect{input.ask_name}.to output("Please enter your name:\n").to_stdout
	end

	it 'should get a name input' do
		expect(input.get_name.class).to eq(String)
	end 
end