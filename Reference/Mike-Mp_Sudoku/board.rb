require_relative 'tile'
require 'colorize'
class Board
  attr_reader :grid
  def self.from_file(filename)
    file = File.readlines(filename).map(&:chomp)
    nums = file.join.split('')
    @grid = Array.new(9) do 
      Array.new(9) { Tile.new(nums.shift.to_i) }
    end
  end

  def initialize(filename)
    @grid = Board.from_file(filename)
  end

  def render
    puts "  0 1 2 3 4 5 6 7 8".colorize(:yellow)
    @grid.each_with_index do |row, i1|
      print i1.to_s.colorize(:yellow) + " "
      row.each_with_index do |num, i2|
        print num.to_s + " "
      end
      puts "\n"
    end
  end

  def [](pos)
    a,b = pos
    @grid[a][b]
  end

  def update_value(pos, value)
    a,b = pos
    @grid[a][b].value = value
  end

  def solved?
    arr = []
    @grid.flatten.each  do |num|
      arr << num.value
    end
    arr.sum == 405
    # @grid.all? { |row| row_solved?(row) } &&
    # @grid.all? 
  end

  # def row_solved?(row)
  #   arr = []
  #   row.each do |num|
  #     arr << num.value
  #   end
  #   arr.sum == 45
  # end


end

# board = Board.new("./puzzles/puzzles/sudoku1_almost.txt")
# board.render
# p board.solved?