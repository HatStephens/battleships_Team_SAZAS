require_relative 'ships'
require_relative 'input_manager'
require_relative 'player'
require_relative 'enemy'


class Game

	attr_reader :ships, :input_manager, :player, :enemy

	def initialize
		@ships = []
		@input_manager = InputManager.new
	end

	def start_message
		@input_manager.greeter
	end

	def create_player
		name = input_manager.get_name
		@player = Player.new(name)
    end

	def create_oponents
        create_player
        @enemy = Enemy.new
	end

	def get_ships
		@ships << [Ship.rubber_ring, Ship.destroyer, Ship.submarine, Ship.battleship, Ship.carrier]
		@ships.flatten!
	end

	def initialize_players_grid(grid)
		grid.print_grid
		get_ships_locations
	end
	
	def place_on_grid(ship, grid) 
		return grid.place_ship_horizontally if ship.direction == "h"
		return grid.place_ship_vertically if ship.direction == "v"
	end

	def get_ships_locations
		ships.each do |ship|
			@can_place_ship = false
			while @can_place_ship == false do
				input.ask_direction(ship.name)
				ship.direction = input.get_direction
				input.ask_row(ship.name)
				ship.start_row = input.get_row
				input.ask_col(ship.name)
				ship.start_col = input.get_col
				can_place_ship = place_on_grid(ship)
			end
		end
	end

	def shot
		row  = input.get_shot_row
		get_col = input.get_shot_col
		results_of_a_shot(row, col)
	end



	def shot_randomlly
		row  = random
		get_col = random
		results_of_a_shot(row, col)
	end

	def results_of_a_shot(row, col)
		#asks every ship if it was hit
		#calls received_missile on the grid
	end

	def update_user_output
		#outputs the result of the shot
		#draws ships_grid
		#draws shots_grid
	end

	def play_enemy
		shot_randomlly
		update_score
		update_user_output
	end

	def play_user
		shot
		update_score
		update_user_output
	end

	def turns
		while player.score < 30 || enemy.score < 30 do
			play_user
			play_enemy
		end
		#call input_manager to say winner message
	end
end
