class Grid

	attr_reader :grid, :grid_size

	DEFAULT_GRID_SIZE = 10

	def initialize(option={})
		@grid_size = option.fetch(:grid_size, DEFAULT_GRID_SIZE)
		@grid = Array.new(@grid_size) {Array.new(@grid_size, '~')}
		@received_ships = []

	end

	def print_grid
		(0..(@grid_size-1)).each { |n| puts @grid[n].join(' ')}
	end

	def received_ships
		@received_ships
	end

	# def receive(ship)
	# 	@received_ships << ship
	# end

	def place_ship_horizontally(ship, start_row, start_col)
		raise "Cannot place here because there is not enough space." if ship.size > 10-(start_col-1)
		((start_col-1)..((start_col-1) + (ship.size-1))).each {|n| raise "Cannot place here because there is a ship in the way." if grid[start_row-1][n]!='~'}
		(0..(ship.size-1)).each {|n| @grid[start_row-1][start_col+(-1+n)] = ship.body[n]}
	end

	def place_ship_vertically(ship, start_row, start_col)
		raise "Cannot place here because there is not enough space." if ship.size > 10-(start_row-1)
		((start_row-1)..((start_row-1) + (ship.size-1))).each {|n| raise "Cannot place here because there is a ship in the way." if grid[n][start_col-1]!='~'}
		(0..ship.size-1).each {|n| @grid[start_row+(-1+n)][start_col-1] = ship.body[n]}
	end


end
