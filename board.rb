class Board
  attr_reader :grid
  
  def initialize(coord_pairs)
    @grid = Array.new(10){ Array.new(10, 0) }
    self.fill(coord_pairs)
  end
  
  def display
    @grid.each do |row|
      row_display = ""
      row.each do |cell|
          row_display += cell == 1 ? " \u25A0".encode("utf-8") : " \u25A1".encode("utf-8")
      end
      puts row_display
    end
  end
  
  def fill(coord_pairs)
    coord_pairs.each do |coords|
      row, col = coords[0], coords[1]
      @grid[row][col] = 1
    end
  end
end
