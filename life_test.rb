require "minitest/autorun"
require "minitest/reporters"
require "./board"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class LifeTest < Minitest::Test
  def test_boards_can_have_varying_sizes
    # This represents a 20x20 board
    b = Board.new 20
    assert_equal 20, b.size
  end

  def test_can_revive
    # This represents a 3x3 board

    b = Board.new 3
    c = Cell.new false

    # This should bring the cell at 2,2 to life
    #   |   |
    #   | X |
    #   |   |
    refute c.alive?(2,2)
    c.revive(2,2)
    assert c.alive?(2,2)
  end

  def test_can_count_neighbors

    b = Board.new 3
    c = Cell.new false
    c.revive(2,2)
    #   |   |
    #   | X |
    #   |   |
    assert_equal 0, b.living_neighbors(2,2)

    c.revive(1,1)
    # X |   |
    #   | X |
    #   |   |
    assert_equal 1, b.living_neighbors(2,2)

    c.revive(2,3)
    # X |   |
    #   | X | X
    #   |   |
    assert_equal 2, b.living_neighbors(2,2)
  end

  def test_lots_of_neighbors
    skip
    b = Board.new 4
    # Bring all cells to life
    (1..4).each do |row|
      (1..4).each do |col|
        b.revive(row, col)
      end
    end
    assert_equal 8, b.living_neighbors(3,3)

    # This is a corner cell
    assert_equal 3, b.living_neighbors(1,4)
  end

  def test_single_cell
    skip
    b = Board.new 3
    b.revive 2,2
    #   |   |
    #   | X |
    #   |   |

    new_b = b.next
    # b should evolve to:
    #   |   |
    #   |   |
    #   |   |
    refute b.alive?(2,2)
  end

  def test_rotor
    skip
    b = Board.new 3
    b.revive 1,2
    b.revive 2,2
    b.revive 3,2
    #   | X |
    #   | X |
    #   | X |

    new_b = b.next
    # b should evolve to:
    #   |   |
    # X | X | X
    #   |   |
    refute b.alive?(1,2)
    refute b.alive?(3,2)
    assert b.alive?(2,1)
    assert b.alive?(2,2)
    assert b.alive?(2,3)
  end
end
