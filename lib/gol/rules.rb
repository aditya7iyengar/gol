# frozen_string_literal: true

module Gol
  module Rules
    def self.apply(grid)
      buffer_grid = grid.real_clone

      buffer_grid.cells.each do |cell|
        if cell.fill
          case num_neighbors(cell, grid)
          when 1, 0
            cell.fill = false
          when 2, 3
            cell.fill = true
          else
            cell.fill = false
          end
        elsif num_neighbors(cell, grid) == 3
          cell.fill = true
        end
      end

      buffer_grid
    end

    def self.num_neighbors(cell, grid)
      cells = grid.cells.select(&:fill)

      cells.select do |other|
        neighbor?(cell, other)
      end.count
    end

    def self.neighbor?(cell, other)
      return false if cell == other

      (cell.x - other.x).abs <= 1 && (cell.y - other.y).abs <= 1
    end
  end
end
