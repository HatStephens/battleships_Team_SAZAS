require_relative 'table_to_screen'

class Grid
	include ScreenTable
	Grid::ScreenTable

	attr_reader :grid, :grid_size

	DEFAULT_GRID_SIZE = 11
	DEFAULT_EMPTY = '~'
	DEFAULT_FIRE = '*'

	def initialize(option={})
		@grid_size = option.fetch(:grid_size, DEFAULT_GRID_SIZE)
		@grid = Array.new(@grid_size) {Array.new(@grid_size-1, DEFAULT_EMPTY)}
		@received_ships = []
		@grid[0] = %w[1 2 3 4 5 6 7 8 9 10]
		(0..10).each {|row_number| @grid[row_number].insert(0, row_number)}

	end

	def print_grid
		# (0..(@grid_size-1)).each { |n| puts @grid[n].join(' ')}
		table_to_screen(self)
	end

	def received_ships
		@received_ships
	end

	# def receive(ship)
	# 	@received_ships << ship
	# end

	def place_ship_horizontally(ship, start_row, start_col)
		raise "Cannot place here because there is not enough space." if ship.size > (@grid_size-(start_col-1))
		((start_col-1)..((start_col-1) + (ship.size-1))).each {|n| raise "Cannot place here because there is a ship in the way." unless empty?(start_row, n+1)}
		(0..(ship.size-1)).each {|n| @grid[start_row-1][start_col+(-1+n)] = ship.body[n]}
	end

	def place_ship_vertically(ship, start_row, start_col)
		raise "Cannot place here because there is not enough space." if ship.size > (@grid_size-(start_row-1))
		((start_row-1)..((start_row-1) + (ship.size-1))).each {|n| raise "Cannot place here because there is a ship in the way." unless empty?(n+1, start_col)}
		(0..ship.size-1).each {|n| @grid[start_row+(-1+n)][start_col-1] = ship.body[n]}
	end

	# WE WILL REFACTOR THESE LAST TWO METHODS. I PROMISE.
	def received_missile(row, column)
		return @grid[row-1][column-1] = 'o' if empty?(row, column) 
		@grid[row-1][column-1] = DEFAULT_FIRE
	end

	def empty?(row, column)
		@grid[row-1][column-1] == DEFAULT_EMPTY
	end

end

grid = Grid.new
grid.print_grid