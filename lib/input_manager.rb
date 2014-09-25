require_relative 'ships'

class InputManager

	def greeter
		puts "Let's play Battleships!"
	end

	def ask_name
		puts "Please enter your name:"
	end 

	def get_name
		@name = ""
		while @name == ""
			ask_name
		    @name = gets.chomp
		end
		@name
	end
	
	def ask_direction(ship_name)
		puts "Please enter the direction to place your #{ship_name} (H or V):"
	end

	def get_direction(ship)
		@direction = gets.chomp.downcase
		return ship.direction = @direction if @direction == "h" || @direction == "v"
		get_direction(ship)
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
end