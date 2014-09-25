require_relative 'grid'
require_relative 'ships'

class Enemy

	attr_accessor :score
	attr_reader :actual_grid, :displayed_grid, :ships

	def initialize
		@score = 0
		@actual_grid = Grid.new
		@displayed_grid = Grid.new
		@count = 0
		@ships = []
	end

	def get_ships
		@ships << [Ship.rubber_ring, Ship.destroyer, Ship.submarine, Ship.battleship, Ship.carrier]
		@ships.flatten!
	end

	def enemy_place_ships
		@ships.each { |ship| random_placement(ship) }			
		@actual_grid.print_grid
	end

	def random_placement(ship)
		ship.direction = ['h','v'].sample
		ship.start_row = rand(9)+1
		ship.start_col = rand(9)+1
		begin
			if ship.direction == 'h'
				@actual_grid.place_ship_horizontally(ship, ship.start_row, ship.start_col)
			else
				@actual_grid.place_ship_vertically(ship, ship.start_row, ship.start_col)
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
	end



end