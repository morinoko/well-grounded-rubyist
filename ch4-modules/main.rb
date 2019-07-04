require_relative "stack"

stack = Stack.new
stack.add_to_stack("item one")
stack.add_to_stack("item two")
stack.add_to_stack("item three")

puts "Objects currently on the stack:"
puts stack.stack

taken = stack.remove_from_stack
puts "Removed '#{taken}'' from stack."
puts "The stack is now"
puts stack.stack
