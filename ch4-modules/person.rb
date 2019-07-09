class Person
	PEOPLE = []
	attr_reader :name, :hobbies, :friends

	def initialize(name)
		@name = name
		@hobbies = []
		@friends = []
		PEOPLE << self
	end

	def has_hobby(hobby)
		@hobbies << hobby
	end

	def has_friend(friend)
		@friends << friend
	end

	def Person.method_missing(m, *args)
		method = m.to_s

		if method.start_with?("all_with_")
			# Gets the attribute at the end of all_with_
			attr = method[9..-1] 

			# Check if Person has that attribute
			if Person.public_method_defined?(attr)
				# Return all the people who have the given argument in their attribute array
				PEOPLE.find_all do |person|
					person.send(attr).include?(args[0])
				end
			else
				raise ArgumentError, "Can't find #{attr}"
			end
		else
			# punt the job to super's method_missing
			super
		end
	end
end

john = Person.new("John")
paul = Person.new("Paul")
george = Person.new("George")
ringo = Person.new("Ringo")
john.has_friend(paul)
john.has_friend(george)
george.has_friend(paul)
ringo.has_hobby("music")

Person.all_with_friends(paul).each do |person| 
	puts "#{person.name} is friends with #{paul.name}"
end
#=> John is friends with Paul
#=> George is friends with Paul

Person.all_with_pets
#=> Can't find pets

Person.blah
#=> undefined method `blah' for Person:Class

