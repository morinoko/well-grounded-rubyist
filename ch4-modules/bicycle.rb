class Bicycle
	attr_reader :gears, :wheels, :seats

	def initialize(gears = 1)
		@wheels = 2
		@seats = 1
		@gears = gears
	end

	def rent
		puts "Sorry but this model is sold out"
	end
end

class Tandem < Bicycle
	def initialize(gears)
		super
		@seats = 2
	end

	def rent
		puts "This model is available!"
	end
end

t = Tandem.new(1)
t.method(:rent)
#=> #<Method: Tandem#rent>
t.method(:rent).super_method
#=> #<Method: Bicycle#rent>
t.method(:rent).super_method.call
#=> Sorry but this model is sold out