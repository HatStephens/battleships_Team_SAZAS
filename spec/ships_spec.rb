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

	it "should create an array " do
		expect(ship.body.class).to be(Array)
	end

	it "should have an array of size = length" do
		expect(ship.body.count).to eq(3)
	end

	it "should put first letter of name in array" do
		expect(ship.body[0]).to eq("S")
	end

	it 'should have a direction' do
		expect(ship.direction.class).to be(String)
	end	

end