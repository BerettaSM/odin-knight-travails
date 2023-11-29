class Knight
    @@moves = [
        # x, y
        [-1, -2], [1, -2],
        [-2, -1], [2, -1],
        [-2,  1], [2,  1],
        [-1,  2], [1,  2],
    ]

    @@visited = Set.new

    def self.reset
        @@visited = Set.new
    end
    
    attr_accessor :position, :parent

    def initialize position, parent=nil
        @position = position
        @parent = parent
        mark_as_visited(position)
    end

    def valid_moves
        x, y = @position

        @@moves.collect do |offset_x, offset_y|
            [x + offset_x, y + offset_y]
        end.filter do |new_x, new_y|
            is_valid_move?(new_x, new_y) && !visited?([new_x, new_y])
        end.collect do |move|
            Knight.new(move, self)
        end
    end

    def visited? position
        position_id = get_id(position)
        @@visited.include?(position_id)
    end

    def visited_positions
        @@visited.clone
    end

    def path
        cur = self
        positions = []
        until cur.nil?
            positions.push(cur.position)
            cur = cur.parent
        end
        positions.reverse
    end

    private

    def is_valid_move? x, y
        x.between?(0,7) && y.between?(0,7)
    end

    def mark_as_visited position
        position_id = get_id(position)
        @@visited.add(position_id)
    end

    def get_id position
        x, y = position
        "#{x},#{y}"
    end
end

def knight_moves(from, to)
    Knight.reset
    moves = [ Knight.new(from) ]

    until moves.empty?
        knight = moves.shift
        return knight.path if knight.position == to
        knight.valid_moves.each { |new_move| moves.push(new_move)}
    end
end
