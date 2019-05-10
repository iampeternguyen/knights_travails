require_relative 'polytreenode'

class KnightPathFinder
    def initialize(start)
        @root_node = PolyTreeNode.new(start)
        build_move_tree
    end

    def build_move_tree
    end

    def self.valid_moves
        
    end

end

knight = KnightPathFinder.new
p knight