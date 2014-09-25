require 'player'

describe Player do

	let(:player){Player.new("anna")}
	 it "should have a name" do
	 	expect(player.name.class).to eq(String)
	 end

	 it "should have a score" do
	 	expect(player.score).to eq(0)
	 end


end 