require_relative 'stacklike'
require_relative 'suitcase'

class CargoHold
	include Stacklike

	def load_and_report(obj)
		puts "Loading object #{obj.object_id}"
		add_to_stack(obj)
	end

	def unload
		remove_from_stack
	end
end

cargo_hold = CargoHold.new
suitcase1 = Suitcase.new
suitcase2 = Suitcase.new
suitcase3 = Suitcase.new

cargo_hold.load_and_report(suitcase1)
cargo_hold.load_and_report(suitcase2)
cargo_hold.load_and_report(suitcase3)

first_unloaded = cargo_hold.unload
puts "The first suitcase off the plane is #{first_unloaded.object_id}"


