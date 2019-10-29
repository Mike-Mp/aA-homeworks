require_relative 'board'

class Sudoku
  attr_reader :board
  def initialize(filename)
    @board = Board.new(filename)
  end

  def run
    play_game until game_over?
    if game_over?
      puts "Congrats. You finished the game."
    end
  end

  def game_over?
    @board.solved?
  end

  def play_game
    @board.render
    puts "Choose a tile. E.g 0,4. Don't input numbers less than 0 or more than 8"
    raw_pos = gets.chomp
    pos = [raw_pos[0].to_i, raw_pos[-1].to_i]
    puts "Choose a value 1-9 for the tile."
    tile_value = gets.chomp.to_i

    update_tile(pos, tile_value)
  end

  def update_tile(pos, tile_value)
    if pos[0] > 8 || pos[1] > 8
      puts "Please enter a valid position."
      sleep(3)
      return
    end

    if tile_value > 9 || tile_value < 1
      puts "Choose a valid tile value."
      sleep(3)
      return
    end

    if @board[pos].given
      puts "You can't change a given value. (magenta colored)"
      sleep(3)
      return
    else
      @board.update_value(pos, tile_value)
      return
    end

  end

end

game = Sudoku.new("./puzzles/puzzles/sudoku1.txt")
game.run
