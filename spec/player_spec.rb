require 'player'

describe Player do

	let(:player){Player.new("anna")}
	let(:player_grid) {Grid.new}

	 it "should have a name" do
	 	expect(player.name.class).to eq(String)
	 end

	 it "should have a score" do
	 	expect(player.score).to eq(0)
	 end

	 it "the player should have a grid" do
	 	expect(player_grid.grid[10][10]).to eq('~')
	 end

	 it "should register an increase in the score" do
	 	expect{player.increase_score(1)}.to change{player.score}.by(1)
	 end

end 