class Game
  DIRECTIONS = [[1,1], [1,0], [0,1], [1,-1], [-1,1], [-1,-1], [-1,0], [0,-1]]
  
  attr_reader :board
  
  def initialize(coord_pairs)
    @board = Board.new(coord_pairs)
    self.play
  end
  
  def count_neighbors(coord)
    neighbors = 0
    DIRECTIONS.each do |dir|
      row, col = coord[0] + dir[0], coord[1] + dir[1]
      if row >= 0 && col >= 0 && row < 10 && col < 10 && @board.grid[row][col] == 1
          neighbors += 1
      end
    end
    neighbors
  end
  
  def play
    while true
      @board.display
      puts
      
      dying, born = [], []
      (0..9).each do |row|
        (0..9).each do |col|
          neighbors = self.count_neighbors([row, col])
          if @board.grid[row][col] == 1
            dying << [row, col] if (neighbors < 2 || neighbors > 3)
          else
            born << [row, col] if neighbors == 3
          end
        end
      end
      
      dying.each{ |coord| @board.grid[coord[0]][coord[1]] = 0 }
      born.each{ |coord| @board.grid[coord[0]][coord[1]] = 1 }
      sleep(1)
    end
  end
end