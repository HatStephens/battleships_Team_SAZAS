require_relative 'grid'

class Player
	
	attr_accessor :player_grid
	attr_reader :name, :score

	def initialize(name)
		@name = name
		@score = 0
		@player_grid = Grid.new
		@ships = []
	end

	def increase_score (number)
		@score += number
	end

	def player_shoot (enemy, row, column)
		enemy.actual_grid.received_shot(row, column)
		enemy.actual_grid.print_grid
	end	

	def get_ships
		@ships << [Ship.rubber_ring, Ship.destroyer, Ship.submarine, Ship.battleship, Ship.carrier]
		@ships.flatten!
	end
end