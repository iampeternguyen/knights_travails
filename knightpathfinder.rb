require_relative 'polytreenode'

class KnightPathFinder
  attr_accessor :considered_positions
  def initialize(start)
    @root_node = PolyTreeNode.new(start)
    @considered_positions = [[0,0], [1,3]]
    build_move_tree
  end

  def build_move_tree
    
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

end

knight = KnightPathFinder.new([0,0])
p knight.class.valid_moves([2,2])