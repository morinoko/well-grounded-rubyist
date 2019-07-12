# Shows how self can remain the same even if scope changes
class C
    def x(value_for_a, recurse = false)
        a = value_for_a
        print "Here is the inspect-string for 'self':"
        puts self.object_id
        puts "And here's a:"
        puts a

        if recurse
            puts "Calling myself (recurusion)..."
            x("Second value for a")
            puts "Back after recursion; here's a:"
            puts a
        end
    end
end

c = C.new
c.x("First value for a", true)