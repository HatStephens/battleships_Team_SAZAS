require 'terminal-table'
require_relative 'grid'

module ScreenTable

def table_to_screen(grid)

	table = Terminal::Table.new do |rows|
		(0..(grid.grid_size-1)).each do |n| 
			rows << grid.grid[n]
			rows.add_separator
		end
	end
end


end
