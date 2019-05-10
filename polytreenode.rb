class PolyTreeNode
  attr_reader :parent, :children, :value
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(parent)
    if parent.nil?
      return @parent = nil
    elsif @parent && @parent != parent
      @parent.children.slice!(@parent.children.index(self))
    end
    @parent = parent
    @parent.children.push(self) unless @parent.children.include?(self)
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    if @children.include?(child)
          child.parent = nil
    else
      raise "node is not a child"
    end
  end

  def inspect
    { 'value' => @value, 'children' => @children }.inspect
  end

  def dfs(target)

    @children.each do |child|
      search = child.dfs(target)
      return search unless search.nil?
    end

    return self if @value == target
    nil
  end

  def bfs(target)
    queue = [self]
    while !queue.empty?
      node = queue.shift
      return node if node.value == target
      node.children.each do |child|
        queue << child
      end
    end
    nil
  end
end