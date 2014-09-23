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

	def self.destroyer
		new(:destryer, 2)
	end

	def self.submarine
		new(:submarine, 3)
	end

	def self.battleship
		new(:battleship, 4)
	end

	def self.aircraft
		new(:aicraft, 5)
	end
end
