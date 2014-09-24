class Game

	attr_accessor :name

	def initialize
		puts "Let's play Battleships!"
	end

	def ask_name
		puts "Please enter your name:"
		@name = gets.chomp
	end 
end