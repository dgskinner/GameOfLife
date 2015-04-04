require_relative "board"
require_relative "game"

starting_coordinates = [
  [[1, 1], [1, 2], [1, 3], [2, 2], [2, 3], [2, 4]],
  [[2, 1], [1, 2], [1, 3], [2, 4], [3, 2], [3, 3]],
  [[2, 1], [2, 2], [1, 2], [0, 1], [1, 3]]
]

Game.new(starting_coordinates.sample)
