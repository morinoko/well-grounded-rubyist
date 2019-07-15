# Defining custome === methods
# Using splat to get a varied number of arguments

class Ticket
    attr_accessor :name, :venue, :date

    def initialize(name, venue, date)
        @name = name
        @venue = venue
        @date = date
    end

    def ===(other_ticket)
        @date === other_ticket.date
    end
end

class TicketComparer
    def self.compare(ticket, *tickets_to_compare)
        tickets_to_compare.each do |compared_ticket|
            if ticket === compared_ticket
                puts "Same date as #{compared_ticket.name}!"
            end
        end
    end
end

ticket1 = Ticket.new("ticket1", "Town Hall", "07/08/18")
ticket2 = Ticket.new("ticket2", "Conference Center", "07/08/18")
ticket3 = Ticket.new("ticket3", "Town Hall", "08/09/18")
ticket4 = Ticket.new("ticket4", "Arena", "07/08/18")

puts "#{ticket1.name} is for an event on #{ticket1.date}."
TicketComparer.compare(ticket1, ticket2, ticket3, ticket4)

# Output:
# ticket1 is for an event on 07/08/18.
# Same date as ticket2!
# Same date as ticket4!