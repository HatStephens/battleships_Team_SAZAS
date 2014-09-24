require_relative 'ships'

class Game

	attr_reader :ships
	attr_accessor :name

	def initialize
		@name = []
		@ships = []
	end

	def start_message
		puts "Let's play Battleships!"
	end

	def ask_name
		puts "Please enter your name:"
	end 

	def get_name
		@name = gets.chomp
		while @name == ""
			ask_name
		    @name = gets.chomp
		end
	end

	def get_ships
		@ships << [Ship.rubber_ring, Ship.destroyer, Ship.submarine, Ship.battleship, Ship.carrier]
		@ships.flatten!
	end

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

	def get_row(ship_name)
		@row = gets.chomp.to_i
		ship.start_row = @row
	end

	def ask_col(ship_name)
		puts "Please enter the column to place your #{ship_name}:"
	end

	def get_col(ship_name)
		@col = gets.chomp.to_i
		ship.start_col = @col
	end

	def place_on_grid 
	end

	def loop
	end


end
