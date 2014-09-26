require_relative 'grid'
require_relative 'input_manager'
require_relative 'ships'


class Player
	
	attr_accessor :player_grid
	attr_reader :name, :score, :ships

	def initialize(name)
		@name = name
		@score = 0
		@player_grid = Grid.new
		@ships = []
		@player_grid.print_grid
		@input = InputManager.new
		get_ships_locations
	end

	def increase_score (number)
		@score += number
	end

	def player_shoot (enemy, row, column)
		enemy.actual_grid.received_shot(row, column)
		enemy.actual_grid.print_grid_displayed
	end	

	def get_ships
		@ships << [Ship.rubber_ring, Ship.destroyer, Ship.submarine, Ship.battleship, Ship.carrier]
		@ships.flatten!
	end

	def get_ships_locations
		get_ships
		@ships.each do |ship|
			@can_place_ship = false
			while @can_place_ship == false do
				@input.ask_direction(ship.name)
				ship.direction = @input.get_direction
				@input.ask_row(ship.name)
				ship.start_row = @input.get_row
				@input.ask_col(ship.name)
				ship.start_col = @input.get_col
				@can_place_ship = place_on_grid(ship)
			end
		player_grid.print_grid 
		end
	end

	def place_on_grid(ship)
		
		begin

			return @player_grid.place_ship_horizontally(ship) if ship.direction == "h"
			return @player_grid.place_ship_vertically(ship) if ship.direction == "v"
		
		rescue
			
			return false
		end
			
	end
end