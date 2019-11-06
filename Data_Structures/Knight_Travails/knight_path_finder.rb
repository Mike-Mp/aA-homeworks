require_relative 'polytreenode'

class KnightPathFinder

  def self.valid_moves(pos)
    possible_moves = [
      [1,2],
      [-1,-2],
      [-1,2],
      [1,-2],
      [2,1],
      [-2,-1],
      [-2,1],
      [2,-1]
    ]

    viable_moves = []
    x,y = pos
    possible_moves.each do |(dx,dy)|
      new_pos = [x + dx, y + dy]

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
    viable_moves = KnightPathFinder.valid_moves(pos)
    rejected = viable_moves.reject { |move| @considered_positions.include?(move) }
    rejected.each { |move| @considered_positions << move }
  end

  def build_move_tree
    queue = [@root_node]

    until queue.empty?
      current_node = queue.shift
      current_pos = current_node.value

      new_move_positions(current_pos).each do |next_position|
        next_node = PolyTreeNode.new(next_position)
        current_node.add_child(next_node)
        queue << next_node
      end
    end
  end

  def find_path(end_pos)
    end_node = @root_node.dfs(end_pos)

    trace_path_back(end_node).reverse.map(&:value)
  end

  def trace_path_back(end_pos)
    path = []

    current_node = end_pos
    until current_node.nil?
      path << current_node
      current_node = current_node.parent
    end
    path
  end

end

knightPath = KnightPathFinder.new([0,0])
p knightPath.find_path([7,7])