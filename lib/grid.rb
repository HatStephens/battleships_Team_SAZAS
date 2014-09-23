class Grid

	def initialize
		# @row_array = Array.new(10)
		# @plus_array = Array.new(10,'+')
		# @grid = @row_array.each.with_index { |element, i| @row_array[i]=@plus_array.join(' ') }
		@grid = Array.new(10) {Array.new(10, '+')}
		@received_ships = []
	end

	def display_grid
		(0..9).each { |n| puts @grid[n].join(' ')}
		# @grid
	end

	def received_ships
		@received_ships
	end

	def receive(ship)
		@received_ships << ship
	end

	def place_ship_horizontally(ship, start_row, start_col)
		@grid[start_row-1][start_col-1] = ship.body[0]
		@grid[start_row-1][start_col] = ship.body[1]
		@grid[start_row-1][start_col+1] = ship.body[2]
	end


end
