class PolyTreeNode

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = node
    if !(@parent.nil?) && !(@parent.children.include?(self))
      @parent.children << self
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise Error if child_node.parent.nil?    
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    self.children.each do |child|
      result =  child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?
      el = queue.shift
      if el.value != target_value
        el.children.each { |child| queue << child }
      else
        return el
      end
    end

  end

  attr_reader :value, :parent, :children
end