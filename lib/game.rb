require_relative 'ships'
require_relative 'input_manager'
require_relative 'player'
require_relative 'enemy'


class Game

	attr_reader :ships, :input, :player, :enemy

	def initialize
		@ships = []
		@input = InputManager.new
		start_message
		create_oponents
	end

	def start_message
		@input.greeter
	end

	def create_player
		name = input.get_name
		@player = Player.new(name)
    end

	def create_oponents
        enemy = Enemy.new
        create_player
	end
	
	def shot
		row  = input.get_shot_row
		col = input.get_shot_col
		puts "rew: #{row} and column : #{col}"
		begin
			enemy.received_shot(row, col)
			puts "been in enemy.received_shot"
			enemy.displayed_grid.print_grid
		rescue Exception => e
			shot
		end
	end

    def shot_randomlly
		row  = enemy.get_row_randomy
		col = enemy.get_col_random

		player.player_grid.received_shot(row, col)
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
		play_user if enemy.score < 15
		input.print_lost_message 
	end

	def play_user
		shot
		update_score
		update_user_output
		play_enemy if player.score < 15
		input.print_win_message
	end

	def turns
		play_user
	end
end
