require '..app/spec/spec_helper'
require '..app/controller/cells_controller'

describe CellsController do
  let(:array) { [[1, 1, 0], [0, 0, 0], [0, 0, 0]] }
  let(:cells) { CellsController.new(array) }

  describe '#find_live_cells' do
    it 'find live cells' do
      expect(cells.find_live_cells).to eq(2)
    end

    it 'not found live cells' do
      array[0][0] = 0
      array[0][1] = 0

      expect(cells.find_live_cells).to eq(0)
    end
  end

  describe '#configuration' do
    let(:current_configuration) { Array.new }
    let(:configuration) { cells.configuration(current_configuration) }

    it 'find configuration' do
      expect(configuration).to eq([0, 0, 0, 1])
    end

    it 'not found configuration' do
      array[0][0] = 0
      array[0][1] = 0

      expect(configuration).to be_empty
    end
  end

  describe '#live_neighbors' do
    it 'find live heighbors for 0, 1' do
      array[0][2] = 1

      expect(cells.live_neighbors(0, 1)).to eq(2)
    end

    it 'find live heighbors for 1, 1' do
      array[0][1] = 0

      expect(cells.live_neighbors(1, 1)).to eq(1)
    end
  end
end