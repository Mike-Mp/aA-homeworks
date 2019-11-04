require_relative 'polytreenode'

class KnightPathFinder
  
  def self.valid_moves(pos)
    moves = [[-2,-1],[2,1],[-1,-2],[1,2],[-1,2],[1,-2],[-2,1],[2,-1]]
    viable_moves = []

    x,y = pos
    moves.each do |(dx,dy)|
      new_pos = [x+dx, y+dy]
     
      if new_pos.all? { |coord| coord.between?(0,7) }
        viable_moves << new_pos
      end
    end
    viable_moves
  end

  def initialize(starting_position)
    @starting_position = starting_position
    @root_node = PolyTreeNode.new(starting_position)
    @considered_positions = [starting_position]
    build_move_tree
  end

  def new_move_positions(pos)
    valid_pos = KnightPathFinder.valid_moves(pos)
    valid_pos.reject { |pos| @considered_positions.include?(pos) }
      .each { |pos| @considered_positions << pos }
  end

  def build_move_tree
    queue = [@root_node]

    until queue.empty?
      current_node = queue.shift
      current_pos = current_node.value
      
      new_move_positions(current_pos).each do |next_pos|
        next_node = PolyTreeNode.new(next_pos)
        current_node.add_child(next_node)
        queue << next_node
      end
    end
  end
 


end

kpf = KnightPathFinder.new([0,0])
p kpf.find_path([1,1])