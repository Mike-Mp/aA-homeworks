require_relative "Card"
require_relative "Board"
require "byebug"

class Game
  
  def initialize
    @board = Board.new
    @previous_pos = []
  end

  def run
    @board.populate
    play_game until game_over?

    winner! if game_over?
  end

  private

  attr_reader :board

  def play_game
    system("clear")
    @board.render
    puts "Pick a position seperated by a comma."
    input = gets.chomp
    pos = [input[0].to_i, input[-1].to_i]

    if pos.any? { |ele| ele > 3 }
      system("clear")
      puts "Input out of bounds. Please enter coordinates from 0 to 3."
      sleep(4)
      return
    end

    make_guess(pos)
  end

  def game_over?
    @board.won?
  end

  def winner!
    puts "Congratulations. You correctly guessed every answer."
  end

  def make_guess(pos)
    # debugger

    if @board.grid[pos[0]][pos[1]].visible
      puts "You have already found a pair with this value. Pick another option"
      sleep(3)
      return
    end
    
    if @previous_pos.empty?
      @previous_pos = pos
      return @board.reveal(pos)
    end

    if @board.grid[@previous_pos[0]][@previous_pos[1]].value == @board.grid[pos[0]][pos[1]].value
      @board.grid[@previous_pos[0]][@previous_pos[1]].reveal
      @board.grid[pos[0]][pos[1]].reveal
      puts "\nFound a pair!"
      sleep(3)
      @previous_pos = []
    else
      system("clear")
      @board.grid[@previous_pos[0]][@previous_pos[1]].reveal
      @board.grid[pos[0]][pos[1]].reveal
      @board.render
      puts "\nIncorrect guess. Try again."
      sleep(4)
      @board.grid[@previous_pos[0]][@previous_pos[1]].hide
      @board.grid[pos[0]][pos[1]].hide
      @previous_pos = []
    end
  end


end


game = Game.new
game.run