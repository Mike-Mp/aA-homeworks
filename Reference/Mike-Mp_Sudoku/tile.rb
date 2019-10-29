require 'colorize'

class Tile
  attr_reader :given
  attr_accessor :value
  def initialize(value)
    @value = value
    @given = value == 0 ? false : true
  end

  def to_s
    @value.to_s.colorize(color)
  end

  def color
    @given ? :magenta : :white
  end

end