module Stacklike
    def stack
        @stack ||= []
    end

    def add_to_stack(object)
        stack.push(object)
    end

    def remove_from_stack
        stack.pop
    end
end