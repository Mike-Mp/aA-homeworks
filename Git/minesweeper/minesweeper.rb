require 'yaml'
require_relative 'board'

class Minesweeper

  LAYOUT = {
    small: { grid_size: 9, num_bombs: 10 }
  }

  def initialize(size)
    layout = LAYOUT[size]
    @board = Board.new(layout[:grid_size], layout[:num_bombs])
  end

  def run
    until @board.win? || @board.lost?
      system('clear')
     puts @board.render

      action, pos = guess_move
      perform_move(action,pos)
    end
    if @board.win?
      puts "Winner!"
    elsif @board.lost?
      puts @board.reveal
      puts "***BOMB HIT***"
    end
  end

  def guess_move
    puts "Choose an action and a position. E.g 'e,0,4'"
    action, row, col = gets.chomp.split(',')

    [action, [row.to_i, col.to_i]]
  end

  def perform_move(action,pos)
    tile = @board[pos]

    case action
    when 'f'
      tile.toggle_flag
    when 'e'
      tile.explore
    when 's'
      save
    end
  end

  def save
    File.write("./save.yml", YAML.dump(self))
  end


end

class Start

  def initialize
    greeting
  end

  def greeting
    puts "Welcome to Minesweeper. Load saved game? (y/n)"
    input = gets.chomp.downcase
    if input == 'y'
      YAML.load_file("./save.yml").run
    else
      minesweeper = Minesweeper.new(:small)
      minesweeper.run
    end
  end

end

start = Start.new