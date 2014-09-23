class Ship

	attr_reader :size
	attr_reader :name
	attr_reader :body
	
	def initialize(name, length)
		@size = length
		@name = name
		@body =[]
		@size.times{@body << @name[0].upcase}
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
