class Grid

	def initialize
		# @row_array = Array.new(10)
		# @plus_array = Array.new(10,'+')
		# @grid = @row_array.each.with_index { |element, i| @row_array[i]=@plus_array.join(' ') }
		@grid = Array.new(10) {Array.new(10, '+').join(' ')}
		@received_ships = []
	end

	def display_grid
		puts @grid
	end

	def received_ships
		@received_ships
	end

	def receive(ship)
		@received_ships << ship
	end


end

grid = Grid.new
print grid.display_grid