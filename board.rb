require 'pry'

class Cell
  attr_reader :alive

  def initialize alive
    @alive = alive
  end

  def alive?(x,y)
    @alive
  end

  def die(x,y)
    @alive = false
  end

  def revive(x,y)
    @alive = true
  end

end

class Board
attr_reader :size

  def initialize size
    @size = size
    @board = Array.new(size) {Array.new(size) {Cell.new false}}
  end

  def living_neighbors(x,y)
    cell_count = 0
    x = [-1, 0, 1]
    y = [-1, 0, 1]

    x.each do |r|
      y.each do |c|
        unless c == 0 && r == 0
          if @board[(x+r)][(y+c)] == 1
            cell_count += 1
          end
        end
      end
    end
  end

end

#
# def neighbors cell
#
#   neighbors = []
#   x = cell.x
#   y = cell.y
#   (x-1..x+1).each do |rows|
#     (y-1..y+1).each do |columns|
#       next if rows == x && columns == y
#       if rows >= 0 && columns >= 0
#       neighbors.push ([rows,columns])
#     end
#       end
#     end
#     neighbors
#   end
# end
