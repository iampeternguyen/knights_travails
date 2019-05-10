require_relative 'polytreenode'

class KnightPathFinder
    def initialize(start)
        @root_node = PolyTreeNode.new(start)
        build_move_tree
    end

    def build_move_tree
    end

    def self.valid_move(pos)
        row, col = pos 
        row.between?(0,7) && col.between?(0,7)



    end
    # delta = [
    #     [-1, -1], [-1, 0], [-1, 1],
    #     [ 0, -1],        , [ 0, 1],
    #     [ 1, -1], [ 1, 0], [ 1, 1]
    # ]
end


p KnightPathFinder.valid_move([0, 8])