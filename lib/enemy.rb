require_relative 'grid'
require_relative 'ships'

class Enemy

	attr_accessor :score
	attr_reader :actual_grid, :displayed_grid, :ships

	def initialize
		@score, @count = 0, 0
		@actual_grid = Grid.new
		@ships = []
		get_ships
		enemy_place_ships
	end

	def get_ships
		@ships << [Ship.rubber_ring, Ship.destroyer, Ship.submarine, Ship.battleship, Ship.carrier]
		@ships.flatten!
	end

	def enemy_place_ships
		@ships.each { |ship| random_placement(ship) }			
	end

	def random_placement(ship)
		ship.direction = ['h','v'].sample
		ship.start_row = rand(9)+1
		ship.start_col = rand(9)+1
		begin
			if ship.direction == 'h'
				@actual_grid.place_ship_horizontally(ship)
			else
				@actual_grid.place_ship_vertically(ship)
			end
		rescue
			random_placement(ship)
		end
	end

	def enemy_shoot(player)
		begin
			player.player_grid.received_shot(rand(9)+1, rand(9)+1)
		rescue
			enemy_shoot(player)
		end
		player.player_grid.print_grid
	end


	def received_shot(row, col)
		result_shot = actual_grid.received_shot(row, col)
		
		displayed_grid[row][col] = result_shot
	end
end