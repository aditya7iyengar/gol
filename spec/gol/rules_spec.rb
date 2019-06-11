# frozen_string_literal: true

RSpec.describe Gol::Rules do
  let(:grid) do
    Gol::Grid.new(cells)
  end

  describe 'when there is only one filled cell' do
    let!(:cells) { [Gol::Grid::Cell.new(true, 0, 0)] }

    it 'destroys the cell' do
      grid2 = Gol::Rules.apply(grid)
      expect(grid2.filled_cells).to eq([])
    end
  end

  describe 'when there is a unfilled cell with three neighbors' do
    let!(:target_cells) do
      [
        Gol::Grid::Cell.new(true, 0, 0),
        Gol::Grid::Cell.new(true, 0, 1),
        Gol::Grid::Cell.new(true, 1, 0),
        Gol::Grid::Cell.new(true, 1, 1)
      ]
    end

    let!(:cells) do
      [
        Gol::Grid::Cell.new(false, 0, 0),
        Gol::Grid::Cell.new(true, 0, 1),
        Gol::Grid::Cell.new(true, 1, 0),
        Gol::Grid::Cell.new(true, 1, 1)
      ]
    end

    it 'fills the cell' do
      grid2 = Gol::Rules.apply(grid)
      expect(grid2.filled_cells).to eq(target_cells)
    end
  end
end
