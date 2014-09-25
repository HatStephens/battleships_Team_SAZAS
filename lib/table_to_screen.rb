require 'terminal-table'

module ScreenTable
	
	def table_to_screen(grid)
		create_table(grid)
		puts @table
	end

	def create_table(grid)
		@table = Terminal::Table.new do |rows|
			(0..(grid.grid_size)).each do |n| 
			rows << grid.grid[n]
			rows.add_separator
			end
		end
	end

end
