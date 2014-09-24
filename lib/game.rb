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
			puts "Please use h or v."
			@direction = gets.chomp.downcase
		end
		ship.direction = @direction
	end

end