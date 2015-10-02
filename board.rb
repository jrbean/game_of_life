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
    sum = 0
    @board.each do |x|
      @board.each do |y|

  end

end
