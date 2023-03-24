class Stack
  def initialize
    # create ivar to store stack here!
    @stacks = []
  end

  def push(el)
    # adds an element to the stack
    @stacks.push(el)
  end

  def pop
    # removes one element from the stack
    @stacks.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    @stacks.last
  end
end

stacks = Stack.new
stacks.push("first")
stacks.push("second")
stacks.push("third")
stacks.push("fourth")
stacks.push("fifth")

p stacks.peek
p stacks.pop
p stacks.peek
p stacks.pop
p stacks.push("six")
p stacks.push("seven")
p stacks.pop
p stacks.peek