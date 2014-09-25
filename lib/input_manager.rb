class InputManager

	def start_message
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
end