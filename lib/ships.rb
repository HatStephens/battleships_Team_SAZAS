class Ship

	attr_reader :size, :name, :body
	attr_accessor :direction
	
	def initialize(name, length)
		@size = length
		@name = name
		@body =[]
		@size.times{@body << @name[0].upcase}
		@direction = ""
	end

	def self.rubber_ring
		new(:rubber_ring, 1)
	end

	def self.destroyer
		new(:destroyer, 2)
	end

	def self.submarine
		new(:submarine, 3)
	end

	def self.battleship
		new(:battleship, 4)
	end

	def self.carrier
		new(:carrier, 5)
	end

end
