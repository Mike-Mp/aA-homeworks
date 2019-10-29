puts "range ---"

def range(start, finish)
  return [] if finish <= start

 
  range(start,finish-1) << finish -1
end

def ite_range(nums)
  sum = 0
  nums.each {|num| sum += num}
  sum
end

def range_rec(nums)
  return 0 if nums.empty?

  nums[0] + range_rec(nums.drop(1))
end

p range(1,5)
p ite_range([1,2,3,4,5])
p range_rec([1,2,3,4,5])

puts "\nexponent ---"

def exponent(base,power)
  return 1 if power == 0
  base * exponent(base, power-1)
end

p exponent(2,4)

puts "deep dup ---"

class Array

  def deep_dup
    arr = []
    self.each do |ele|
      if ele.is_a?Array
        arr << ele.deep_dup
      else
        arr << ele
      end
    end
    arr
  end

end

or_arr = [1,[2],[3,[4]]]

p duped_arr = or_arr.deep_dup
duped_arr[1] << "cringe"
p or_arr
p duped_arr

puts "fibonacci ---"

def fibonacci(n)
  if n <= 2
    [0, 1].take(n)
  else
    fibs = fibonacci(n - 1)
    fibs << fibs[-2] + fibs[-1]
  end
end

p fibonacci(2)

def bsearch(array,target)
  return nil if array.empty?

  mid = array.length / 2
  case target <=> array[mid]
  when -1
    # search left side
    bsearch(array.take(mid), target)
  when 0
    # found it!
    mid
  when 1
    # search right side
    sub_answer = bsearch(array.drop(mid +1), target)
    sub_answer.nil? ? nil : (mid + 1) + sub_answer
  end
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil