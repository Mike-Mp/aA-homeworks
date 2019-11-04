require_relative 'tile'

class Board

  attr_reader :num_bombs, :grid_size

  def initialize(grid_size, num_bombs)
    @grid_size, @num_bombs = grid_size, num_bombs

    populate_board
  end

  def win?
    @grid.flatten.all? { |tile| tile.bombed? != tile.explored?  }
  end

  def lost?
    @grid.flatten.any? { |tile| tile.bombed? && tile.explored? }
  end

  def [](pos)
    a,b = pos
    @grid[a][b]
  end

  def render(reveal = false)
    @grid.map do |row|
      row.map do |tile|
        reveal ? tile.reveal : tile.render
      end.join.split("\n")
    end
  end

  def reveal
    render(true)
  end

  private

  def populate_board
    @grid = Array.new(@grid_size) do |row|
      Array.new(@grid_size) { |col| Tile.new(self, [row,col]) }
    end
    plant_bombs
  end

  def plant_bombs
    bombs = 0

    while bombs < num_bombs
      rand_pos = Array.new(2) { rand(@grid_size) }

      tile = self[rand_pos]
      next if tile.bombed?

      tile.plant_bomb

      bombs += 1
    end
    nil
  end

end