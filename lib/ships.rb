class Ship

	attr_reader :size
	attr_reader :name
	
	def initialize(name, length)
		@size = length
		@name = name
	end
	
end
