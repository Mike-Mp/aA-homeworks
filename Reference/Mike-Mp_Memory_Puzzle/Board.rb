require_relative "Card"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(4) { Array.new(4) }
  end

  def render
    @grid.each_with_index do |subArray, idx1|
      puts idx1
      subArray.each_with_index do |ele, idx2|
        puts "#{ele} #{idx2}"
      end
    end
  end

  def populate
    pairs = ("A".."H").to_a * 2
    shuffled_pairs = pairs.shuffle
        
    @grid.each do |subArray|
      subArray.map! do |ele|
        Card.new(shuffled_pairs.pop)
      end
    end
  end

  def won?
    @grid.flatten.all? { |card| card.visible }
  end

  def reveal(guessed_pos)
    a,b = guessed_pos
    @grid[a][b].reveal
    return @grid[a][b].value
  end

end