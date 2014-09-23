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

end
