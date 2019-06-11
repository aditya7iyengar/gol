# frozen_string_literal: true

module Gol
  # Abstraction around the grid
  class Grid
    RANGE = 100

    attr_accessor :cells

    def initialize(cells)
      @cells = cells
    end

    def self.super_new(cells)
      (0..RANGE).each do |x|
        (0..RANGE).each do |y|
          unless has_cell(cells, x, y)
            cells << Gol::Grid::Cell.new(false, x, y)
          end
        end
      end

      Gol::Grid.new(cells)
    end

    def self.has_cell(cells, x, y)
      cells.any? { |cell| cell.x == x && cell.y == y }
    end

    def draw
      # TODO
    end

    def real_clone
      new_cells = cells.map(&:clone)
      Gol::Grid.new(new_cells)
    end

    def filled_cells
      cells.select(&:fill)
    end

    class Cell
      attr_accessor :fill, :x, :y

      def initialize(fill, x, y)
        @fill = fill
        @x = x
        @y = y
      end

      def ==(other)
        x == other.x && y == other.y && fill == other.fill
      end
    end
  end
end
