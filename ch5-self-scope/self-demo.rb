puts self

class C
    puts "Just started Class C"
    puts self

    module M
        puts "Nested in module C::M"
        puts self
    end

    def C.w
        puts "Class method w of class C"
        puts "self: #{self}"
    end

    def x
        puts "Class C, method x"
        puts self
    end

    puts "Back in outer level of C"
    puts self
end
puts "--------"

c = C.new
c.x
puts "That was an call to instance method x from: #{c}"
puts "--------"

C.w
puts "That was a call to class method w"
puts "--------"

obj = Object.new
def obj.show_me
    puts "Inside singleton method show_me of #{self}"
end
obj.show_me
puts "Back from call to show_me by #{obj}"
puts "--------"

class Person
    attr_accessor :first_name, :middle_name, :last_name

    def whole_name
        name = "#{first_name} "
        name << "#{middle_name} " if middle_name
        name << last_name
    end
end

john = Person.new
john.first_name = "John"
john.last_name = "Smith"
puts "John's whole name is #{john.whole_name}"
john.middle_name = "Alan"
puts "John's whole name with middle name is #{john.whole_name}"