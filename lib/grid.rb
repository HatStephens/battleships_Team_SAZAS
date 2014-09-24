require_relative 'table_to_screen'

class Grid
	include ScreenTable

	attr_reader :grid, :grid_size

	DEFAULT_GRID_SIZE = 10
	DEFAULT_EMPTY = '~'
	DEFAULT_FIRE = '*'

	def initialize(option={})
		@grid_size = option.fetch(:grid_size, DEFAULT_GRID_SIZE)
		@grid = Array.new(@grid_size+1) {Array.new(@grid_size, DEFAULT_EMPTY)}
		@grid[0] = %w[1 2 3 4 5 6 7 8 9 10]
		@grid[0].insert(0, "")
		(1..10).each {|row_number| @grid[row_number].insert(0, row_number)}
	end

	def print_grid
		table_to_screen(self)
	end

	def place_ship_horizontally(ship, start_row, start_col)
		raise "Cannot place here because there is not enough space." if ship.size > (@grid_size-(start_col-1))
		((start_col)..((start_col) + (ship.size-1))).each {|n| raise "Cannot place here because there is a ship in the way." unless empty?(start_row, n)}
		(0..(ship.size-1)).each {|n| @grid[start_row][start_col+n] = ship.body[n]}
		# print_grid
	end

	def place_ship_vertically(ship, start_row, start_col)
		raise "Cannot place here because there is not enough space." if ship.size > (@grid_size-(start_row-1))
		((start_row)..((start_row) + (ship.size-1))).each {|n| raise "Cannot place here because there is a ship in the way." unless empty?(n, start_col)}
		(0..ship.size-1).each {|n| @grid[start_row+n][start_col] = ship.body[n]}
		# print_grid
	end

	# WE WILL REFACTOR THESE LAST TWO METHODS. I PROMISE.
	def received_missile(row, column)
		raise "You have already been here." if been_here?(row, column)
		return miss(row, column) if empty?(row, column) 
		hit(row,column) 
	end

	def miss(row, column)
		@grid[row][column] = 'o'
		# print_grid
	end

	def hit(row,column)
		@grid[row][column] = DEFAULT_FIRE
		# print_grid
	end

	def empty?(row, column)
		@grid[row][column] == DEFAULT_EMPTY
	end

	def been_here?(row, column)
		@grid[row][column] == 'o' || @grid[row][column] == '*'
	end

end