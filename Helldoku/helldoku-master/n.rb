require "colorize"
class N
  attr_reader :n
  
  def initialize(n)
    @n = n
    @g = n == 0 ? false : true 
  end

  def goodbye
    puts "goodbye" 
  end

  def c 
    rand < 0.25 ? :blue : :red 
  end

  def c?
     m.c? 
  end

  def hi
    puts "hi"
  end
  
  def n=(nn)
    c ? (puts "You can't change the value of a given tile. Bad. I bet you write bad code, too.") : (@n = nn)
  end

end