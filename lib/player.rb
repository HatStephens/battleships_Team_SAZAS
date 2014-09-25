require_relative 'grid'

class Player
	
	attr_accessor :player_grid
	attr_reader :name, :score

	def initialize(name)
		@name = name
		@score = 0
		@player_grid = Grid.new
	end

	def increase_score (number)
		@score += number
	end	
end