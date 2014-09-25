require_relative 'ships'
require_relative 'input_manager'
require_relative 'player'


class Game

	attr_reader :ships, :input_manager, :player

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

	#*******************START******************

	def create_grid
		#creates the grid for placing boats of the player ships_grid
		#creates the grid for placing players shots
		#the grid should have some king of identification of 
		#what kind of grid it is
		#should be call twice
	end
	#******************END******************
	


	def place_on_grid(ship) 
		return grid.place_ship_horizontally ship.direction == "h"
		return grid.place_ship_vertically ship.direction == "v"
	end

	def get_ships_locations
		ships.each do |ship|
			@can_place_ship = false
			while @can_place_ship == false do
				ask_direction(ship.name)
				get_direction(ship)
				ask_row(ship.name)
				get_row(ship)
				ask_col(ship.name)
				get_col(ship)
				can_place_ship = place_on_grid(ship)
			end
		end
	end

	def get_turn
		#decides wish player plays this turn 
		#puts the player in turn in current_player
	end

	def get_shot_row
		#asks user for row to shot
	end

	def get_shot_col
		#askes user for col to shot
	end

	def shot
		row  = get_shot_row
		get_col = get_shot_col
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
