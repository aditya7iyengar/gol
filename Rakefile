# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require './lib/gol'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

RANGE = 50
SIZE = 10
COLOR = 'red'

@grid = Gol::Grid.super_new([
  Gol::Grid::Cell.new(true, 40, 38),
  Gol::Grid::Cell.new(true, 40, 39),
  Gol::Grid::Cell.new(true, 40, 40),
  Gol::Grid::Cell.new(true, 40, 41),
  Gol::Grid::Cell.new(true, 40, 42),

  Gol::Grid::Cell.new(true, 42, 38),
  Gol::Grid::Cell.new(true, 42, 42),

  Gol::Grid::Cell.new(true, 44, 38),
  Gol::Grid::Cell.new(true, 44, 39),
  Gol::Grid::Cell.new(true, 44, 40),
  Gol::Grid::Cell.new(true, 44, 41),
  Gol::Grid::Cell.new(true, 44, 42)
])


desc 'Runs the Game of Life'
task :gol do
  require 'ruby2d'

  @grid.filled_cells.each do |cell|
    s = Square.new(x: SIZE * cell.x, y: SIZE * cell.y, size: SIZE)

    s.add
  end

  on :key_down do |event|
    if event.key == 'n'
      @grid = Gol::Rules.apply(@grid)
    end
  end

  update do
    clear

    @grid.filled_cells.each do |cell|
      s = Square.new(x: SIZE * cell.x, y: SIZE * cell.y, size: SIZE)

      s.add
    end
  end

  show
end
