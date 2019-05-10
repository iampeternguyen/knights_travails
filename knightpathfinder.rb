require_relative 'polytreenode'

class KnightPathFinder
  attr_accessor :considered_positions
  attr_reader :root_node

  def initialize(start)
    @root_node = PolyTreeNode.new(start)
    @considered_positions = [start]
    build_move_tree
  end

  def build_move_tree
    start_pos = self.root_node.value
    potential_moves = new_move_positions(start_pos)
    queue = []
    potential_moves.each do |pos|
      child = PolyTreeNode.new(pos)
      child.parent = self.root_node
      queue << child
    end

    while !queue.empty?
      parent = queue.shift
      next_moves = new_move_positions(parent.value)
      next_moves.each do |pos|
        child = PolyTreeNode.new(pos)
        child.parent = parent
        queue << child
      end
    end
  end

  def self.valid_moves(pos)
    deltas = [[-1, -1], [-1, 0], [-1, 1], [ 0, -1], [ 0, 1], [ 1, -1], [ 1, 0], [ 1, 1]]
    row, col = pos 
    potential_moves = []
    deltas.each do |delta|
      new_row = row + delta[0]
      new_col = col + delta[1]
      potential_moves << [new_row, new_col] if new_row.between?(0,7) && new_col.between?(0,7)
    end
    potential_moves
  end

  def new_move_positions(pos)
    potential_moves = self.class.valid_moves(pos)
    potential_moves = potential_moves.select {|potential_pos| !self.considered_positions.include?(potential_pos) }
    self.considered_positions.concat(potential_moves)
    potential_moves
  end

end

knight = KnightPathFinder.new([0,0])
p knight.root_node
