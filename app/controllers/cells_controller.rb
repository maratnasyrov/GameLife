require '..app/model/cell'

class CellsController
  attr_accessor :cells, :torus_surface, :live_cells_number

  def initialize(cells)
    @cells = cells
    @live_cells_number = 0
  end

  def get_cells
    cells
  end

  def find_live_cells
    live_cells_number = 0

    cells.each_index do |i|
      cells[i].each_index do |j|
        cell = cells[i][j]
        if cell == 1
          live_cells_number += 1
        end
      end
    end
    return live_cells_number
  end

  def configuration(object)
  end

  def live_neighbors(i,j)
  end
end