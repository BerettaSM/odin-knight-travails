require './knight.rb'

test_cases = [
    {from: [0, 0], to: [1, 2]},
    {from: [0, 0], to: [3, 3]},
    {from: [3, 3], to: [0, 0]},
    {from: [3, 3], to: [4, 3]},
    {from: [0, 0], to: [7, 7]},
]

test_cases.each { |test| p knight_moves(test[:from], test[:to]) }
