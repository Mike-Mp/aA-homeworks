class Stack
  attr_reader :array
  def initialize(array)
    # create instance variable to store stack here!
    @array = array
  end

  def push(el)
    # adds an element to the stack
    @array << el
  end

  def pop
    # removes one element from the stack
    @array.delete(@array[-1])
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    @array.last
  end

end

arr = ["ayy"]

test = Stack.new(arr)
p test.peek
p test.array
test.push("lmao")
p test.peek
p test.array
test.pop
p test.peek
p test.array
