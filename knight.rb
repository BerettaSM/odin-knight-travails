move_offsets = [
    # x, y
    [-1, -2], [1, -2],
    [-2, -1], [2, -1],
    [-2,  1], [2,  1],
    [-1,  2], [1,  2],
]

def is_within_board(x, y)
    x.between?(0,7) && y.between?(0,7)
end

def get_board
    board = Array.new(8) { Array.new(8, false) }
end

def knight_moves(from, to, path=[], board=get_board)
    p board
end

