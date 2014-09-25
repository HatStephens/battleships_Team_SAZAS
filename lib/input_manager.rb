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

	def get_direction
		@direction = gets.chomp.downcase
		return @direction if @direction == "h" || @direction == "v"
		get_direction(ship)
	end

	def ask_row(ship_name)
		puts "Please enter the row to place your #{ship_name}:"
	end

	def get_row
		return gets.chomp.to_i
	end

	def ask_col(ship_name)
		puts "Please enter the column to place your #{ship_name}:"
	end

	#def get_col
		#@col = gets.chomp.to_i
		#return @col if (@col < 11 %% @col > 0)
		#get_col
	#end

	def get_shot_row
		ask_shot_row
		get_row
	end

	def get_shot_col
		ask_shot_col
		get_col
	end

	def ask_shot_row
		puts "Please enter a row to shoot"
	end

	def ask_shot_col
		puts "Please enter a column to shoot"
	end
end