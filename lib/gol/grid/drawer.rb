# frozen_string_literal: true

module Gol
  class Grid
    # Draws a grid
    module Drawer
      RANGE = 50
      COLOR = 'red'

      def self.call(grid)
        require 'ruby2d'

        s = Square.new(x: 50, y: 50, size: 100)

        s.color = COLOR

        show
      end
    end
  end
end
