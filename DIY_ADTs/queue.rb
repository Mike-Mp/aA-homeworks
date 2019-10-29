class Queue
  attr_reader :array
  def initialize(array)
    @array = array
  end

  def enqueue(el)
    @array.unshift(el)
  end

  def dequeue
    @array.delete(@array[0])
  end

  def peek
    @array.first
  end

end

arr = ["lel1", "lel2"]

test1 = Queue.new(arr)

p test1.peek
test1.enqueue("lel3")
p test1.peek
p test1.array
test1.dequeue
p test1.peek
p test1.array

