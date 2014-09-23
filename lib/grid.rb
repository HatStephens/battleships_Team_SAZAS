class Grid

	attr_reader :grid

	def initialize
		@grid = Array.new(10) {Array.new(10, '+')}
		@received_ships = []
	end

	def print_grid
		(0..9).each { |n| puts @grid[n].join(' ')}
	end

	def received_ships
		@received_ships
	end

	# def receive(ship)
	# 	@received_ships << ship
	# end

	def place_ship_horizontally(ship, start_row, start_col)
		(0..ship.size).each {|n| @grid[start_row-1][start_col+(-1+n)] = ship.body[n]}
	end


end
