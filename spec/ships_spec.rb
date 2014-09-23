require 'ships'

describe Ship do

	let(:ship) { Ship.new(:submarine, 3) }
	
	it "should initialize with size" do
		# ship = Ship.new(:submarine, 3)
		expect(ship.size).to eq(3)
	end

	it "should initialize with name" do
		# ship = Ship.new(:submarine, 3)
		expect(ship.name).to be(:submarine)
	end


end