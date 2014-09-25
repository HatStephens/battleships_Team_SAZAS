require_relative 'ships'
require_relative 'input_manager'

class Game

	attr_reader :ships, :input_manager

	def initialize
		@ships = []
		@input_manager = InputManager.new
	end

	def start_message
		@input_manager.start_message
	end

	# def ask_name
	# 	puts "Please enter your name:"
	# end 

	def get_name
		@name = input_manager.get_name
		create_players(@name)
	end

	#***************START*******************
	def create_players(name)
		#creates player user and gives it name
		#sets player.is_a_user to true
		#creates player enemy and calls it :enemy
		#sets player.is_a_user to false
		#(game needs 2 attr_accessor player and enemy 
	end

	#*****************END*******************

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
	
	def ask_direction(ship_name)
		puts "Please enter the direction to place your #{ship_name} (H or V):"
	end

	def get_direction(ship)
		@direction = gets.chomp.downcase
		until  @direction == "h" || @direction == "v" do
			ask_direction(ship.name)
			@direction = gets.chomp.downcase
		end
		ship.direction = @direction
	end

	def ask_row(ship_name)
		puts "Please enter the row to place your #{ship_name}:"
	end

	def get_row(ship)
		@row = gets.chomp.to_i
		ship.start_row = @row
	end

	def ask_col(ship_name)
		puts "Please enter the column to place your #{ship_name}:"
	end

	def get_col(ship)
		@col = gets.chomp.to_i
		ship.start_col = @col
	end

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
		update_current_player
		update_user_output
	end

	def play_user
		shot
		update_current_player
		update_user_output
	end

	def update_current_player
		#updates current_player score
		#verifies if current_player is a winner
	end

	def playing_turn(player)
		if(player.is_a_user?)
			play_user
		else
			play_enemy
		end
	end
end
